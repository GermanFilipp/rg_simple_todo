controllers = angular.module('todo_list')

controllers.controller 'SignInController', [
  '$scope'
  '$http'
  'Auth'
  '$location'
  ($scope, $http, Auth, $location) ->

    if (Auth._currentUser)
      $location.path('/')

    config = headers: 'X-HTTP-Method-Override': 'POST'
    Auth.currentUser().then ((user) ->
      $location.path '/'
      ), (error) ->
      $('.alert_error').html '<div class="alert alert-danger" role="alert">' + error.data.error + '</div>'


    $scope.login = (data) ->
      Auth.login(data, config).then ((user) ->
      ), (error) ->
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

    $scope.$on 'devise:unauthorized', (event, xhr, deferred) ->
       if $location.path() == '/'
        $location.path '/login'

]