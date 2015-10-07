controllers = angular.module('todo_list')

controllers.controller 'ProjectsController', [
  '$scope'
  '$http'
  'Projects'
  'Project'
  'ngToastFactory'
  ($scope, $http, Projects,Project,ngToastFactory) ->

    Projects.get (response) ->
      $scope.projects = response.projects


    $scope.createProject = (isValid)->
      if isValid
        Projects.create { name: $scope.nameProject}, (res) ->
              $scope.projects.push res.project
              $scope.nameProject = ''
              $scope.showForm = false
        ngToastFactory.successToast "Project successfully created"
      else ngToastFactory.alertToast "Project name can't be blank"

    $scope.deleteProject = (id,key) ->
      Project.destroy {id: id}, ->
        $scope.projects.splice key, 1
      ngToastFactory.successToast "Project succesfully deleted"

    $scope.updateProject = (value, id) ->
      Project.update {id: id, name: value }, ->
        ngToastFactory.successToast "Project succesfully updated"
      return true

    $scope.showForm = false
]

