todo_list = angular.module('todo_list',[
  'ngRoute',
  'ngResource',
  'templates',
  'ui.sortable',
  'Devise',
  'ngFileUpload',
  'ngDialog',
  'ui.bootstrap',
  'ui.date',
  'xeditable'
])

todo_list.run (editableOptions) ->
  editableOptions.theme = 'bs3'

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