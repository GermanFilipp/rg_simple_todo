angular.module('todo_list').config ($routeProvider) ->
  $routeProvider
  .when('/',
    templateUrl: 'index.html',
    controller: 'ProjectsController'
  )
  .when('/login',
    templateUrl: 'login.html',
    controller: 'SignInController'
  )
  .when('/register',
    templateUrl: 'register.html',
    controller: 'RegisterController'
  )
  .otherwise(
    redirectTo: '/'
  )


###

  todo_list.config [
    '$routeProvider'
    ($routeProvider) ->
      $routeProvider.when('/',
        controller: 'ProjectsController'
        templateUrl: 'index.html')
      .when('/login',
        controller: 'SignInController'
        templateUrl: 'login.html')
      .when('/register',
        controller: 'RegisterController'
        templateUrl: 'register.html')
      .otherwise redirectTo: '/'
  ]###
