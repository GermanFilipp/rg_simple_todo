controllers = angular.module('todo_list')

controllers.controller 'TasksController', [
  '$scope'
  '$http'
  'Tasks'
  'Task'
  ($scope,$http,Tasks,Task) ->
    $scope.createTask = (project_id) ->
      Tasks.create {
          project_id: project_id
          title: $scope.taskName
        }, (res) ->
        $scope.taskName = ''
        $scope.project.tasks.push res.task


    $scope.deleteTask = (id,key) ->
      Task.destroy {id:id},(res) ->
        $scope.project.tasks.splice key, 1

    $scope.updateTask = (value, id) ->
      Task.update {id: id, title: value }, ->
      return value

    $scope.updateStatus = (id, status, key) ->
      Task.update {id: id, status: !status}, ->
        $scope.project.tasks[key].status = !status


    $scope.setDeadline = (id, deadline) ->
      Task.update {id:id, deadline:deadline}

    $scope.dateOptions =
      showOn: 'button',
      buttonText: 'hello'



]





