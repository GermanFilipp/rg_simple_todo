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

