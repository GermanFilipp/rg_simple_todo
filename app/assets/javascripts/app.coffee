todo_list = angular.module('todo_list',[
  'ngRoute',
  'ngResource',
  'templates',
  'gg.editableText',
  'ui.sortable',
  'Devise',
  'ngFileUpload',
  'ngDialog',
  'ui.bootstrap',
  'ui.date'
])

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
]