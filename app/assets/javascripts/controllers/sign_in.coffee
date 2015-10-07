controllers = angular.module('todo_list')

controllers.controller 'SignInController', [
  '$scope'
  '$http'
  'Auth'
  '$location'
  'ngToastFactory'
  ($scope, $http, Auth, $location,ngToastFactory) ->

    if (Auth._currentUser)
      $location.path('/')

    config = headers: 'X-HTTP-Method-Override': 'POST'
    Auth.currentUser().then ((user) ->
      $location.path '/'
      ), (error) ->
        ngToastFactory.alertToast(error.data.error)


    $scope.login = (data) ->
      Auth.login(data, config).then ((user) ->
        ngToastFactory.successToast('Success login')
      ), (error) ->
        ngToastFactory.alertToast('kk')

    $scope.logout = ->
      config = headers: 'X-HTTP-Method-Override': 'DELETE'
      Auth.logout(config).then ((oldUser) ->
      ), (error) ->

    $scope.$on 'devise:login', (event, currentUser) ->
      ngToastFactory.successToast("Authorized")
      $location.path '/'

    $scope.$on 'devise:logout', (event, oldCurrentUser) ->
      ngToastFactory.successToast("Good bye")
      $location.path '/login'

    $scope.$on 'devise:new-session', (event, currentUser) ->

    $scope.$on 'devise:unauthorized', (event, xhr, deferred) ->
      if $location.path() == '/'
         $location.path '/login'

]