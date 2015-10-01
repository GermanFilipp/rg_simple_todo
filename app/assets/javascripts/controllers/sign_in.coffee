controllers = angular.module('todo_list')

controllers.controller 'SignInController', [
  '$scope'
  '$http'
  'Auth'
  '$location'
  ($scope, $http, Auth, $location) ->
    config = headers: 'X-HTTP-Method-Override': 'POST'
    Auth.currentUser().then ((user) ->
      $location.path '/'
    ), (error) ->


    $scope.login = (data) ->
      Auth.login(data, config).then ((user) ->
      ), (error) ->
        console.log(error)
        $('.alert_error').html '<div class="alert alert-danger" role="alert">' + error.data.error + '</div>'

    $scope.logout = ->
      config = headers: 'X-HTTP-Method-Override': 'DELETE'
      Auth.logout(config).then ((oldUser) ->
      ), (error) ->

    $scope.$on 'devise:login', (event, currentUser) ->
      $location.path '/'

    $scope.$on 'devise:logout', (event, oldCurrentUser) ->
      $location.path '/login'

    $scope.$on 'devise:new-session', (event, currentUser) ->
]