controllers = angular.module('todo_list')

controllers.controller 'TasksController', [
  '$scope'
  '$http'
  'Tasks'
  'orderByFilter'
  'Task'
  'ngToastFactory'
  ($scope,$http,Tasks,orderByFilter,Task,ngToastFactory) ->
    $scope.createTask = (project_id,isValid) ->
      if isValid
        Tasks.create {
            project_id: project_id
            title: $scope.taskName
          }, (res) ->
          $scope.taskName = ''
          $scope.project.tasks.push res.task
        ngToastFactory.successToast 'Task successfully created'
      else
        ngToastFactory.alertToast "Task name can't be blank"


    $scope.deleteTask = (id,key) ->
      Task.destroy {id:id},(res) ->
        $scope.project.tasks.splice key, 1
        ngToastFactory.successToast "Task successfully deleted"

    $scope.updateTask = (value, id) ->
      Task.update {id: id, title: value }, ->
        ngToastFactory.successToast "Task successfully updated"
      return

    $scope.updateStatus = (id, status, key) ->
      Task.update {id: id, status: !status}, ->
        $scope.project.tasks[key].status = !status



    $scope.setDeadline = (id, deadline) ->
      Task.update {id:id, deadline:deadline}


    $scope.dateOptions =
      showOn: 'button',
      buttonText: ''

    $scope.sortableOptions = stop: (e, ui) ->
      angular.forEach $scope.project.tasks, (value, key) ->
        Task.update
          id: value.id
          position: key

    angular.forEach $scope.projects, (value, key) ->
      $scope.$watchCollection value, ->
      $scope.projects[key].tasks = orderByFilter($scope.projects[key].tasks, [ 'position' ])

    $scope.showComments = false;

]





