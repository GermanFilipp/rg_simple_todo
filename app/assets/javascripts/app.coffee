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
  'xeditable',
  'ngToast',
  'ngAnimate',
  'ngSanitize'

])

todo_list.run (editableOptions) ->
  editableOptions.theme = 'bs3'

todo_list.config (AuthInterceptProvider) ->
  AuthInterceptProvider.interceptAuth(true);

todo_list.config [
  'ngToastProvider'
  (ngToastProvider) ->
    ngToastProvider.configure additionalClasses: 'my-animation'
    return
]