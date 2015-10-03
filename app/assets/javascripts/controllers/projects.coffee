controllers = angular.module('todo_list')

controllers.controller 'ProjectsController', [
  '$scope'
  '$http'
  'Projects'
  'Project'
  'CheckLogin'
  '$timeout'
  ($scope, $http, Projects,Project,CheckLogin,$timeout) ->

    Projects.get (response) ->
      $scope.projects = response.projects
      console.log($scope)

    $scope.createProject = (isValid)->
      if isValid
        Projects.create { name: $scope.nameProject}, (res) ->
              $scope.projects.push res.project
              $scope.nameProject = ''
              $scope.showForm = false


    $scope.deleteProject = (id,key) ->
      Project.destroy {id: id}, ->
        $scope.projects.splice key, 1

    $scope.updateProject = (value, id) ->
      Project.update {id: id, name: value }, ->
      return value

    $scope.showForm = false
]

