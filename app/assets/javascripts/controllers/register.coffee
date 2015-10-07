controllers = angular.module('todo_list')

controllers.controller 'RegisterController', [
  '$scope'
  '$http'
  'Auth'
  '$location'
  'ngToastFactory'
  ($scope, $http, Auth, $location,ngToastFactory) ->

    if (Auth._currentUser)
      $location.path('/')

    config = headers: 'X-HTTP-Method-Override': 'POST'

    $scope.register = (data) ->
      Auth.register(data, config).then ((registeredUser) ->
      ), (error) ->
        ngToastFactory.successToast('Registration failed')

    $scope.$on 'devise:new-registration', (event, user) ->
      $location.path '/'
]