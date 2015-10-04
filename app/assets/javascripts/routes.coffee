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

