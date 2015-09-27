controllers = angular.module('todo_list')

controllers.controller 'ProjectsController', [
  '$scope'
  '$http'
  'Projects'
  'Project'
  ($scope, $http, Projects,Project) ->

    Projects.get (response) ->
      $scope.projects = response.projects
      console.log($scope)

    $scope.createProject = ->
      Projects.create { name: $scope.nameProject }, (res) ->
        $scope.nameProject = ''
        $scope.projects.push res.project

    $scope.deleteProject = (id,key) ->
      Project.destroy { id: id }, ->
        $scope.projects.splice key, 1

    $scope.updateProject = (value, id) ->
      Project.update {id: id, name: value }, ->
      return value

]

