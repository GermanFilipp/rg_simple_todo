todo_list = angular.module('todo_list')

todo_list.factory 'Projects', [
  '$resource'
  ($resource) ->
    $resource '/projects', {},
      'get': method: 'GET'
      'create':
        method: 'POST'
        params: name: '@name'
]

todo_list.factory 'Project', [
  '$resource'
  ($resource) ->
    $resource '/projects/:id', {},
      'destroy':
        method:'DELETE'
        params: id: '@id'
      'update':
        method:'PATCH'
        params:
          name: '@name'
          id: '@id'
]

todo_list.factory 'Tasks', [
  '$resource'
  ($resource) ->
    $resource '/tasks', {},
      'create':
        method: 'POST'
        params:
          project_id: '@project_id'
          title: '@title'
]

todo_list.factory 'Task', [
  '$resource'
  ($resource) ->
    $resource '/tasks/:id', {},
      'destroy':
        method:'DELETE'
        params: id: '@id'
      'update':
        method:'PATCH'
        params:
          id: '@id'
          title: '@title'
          status: '@status'
          deadline: '@deadline'
          position: '@position'

]

todo_list.factory 'Comments', [
  '$resource'
  ($resource) ->
    $resource '/comments', {},
      'create':
        method: 'POST'
        params:
          task_id: '@task_id'
          text: '@text'
]

todo_list.factory 'Comment', [
  '$resource'
  ($resource) ->
    $resource '/comments/:id', {},
      'destroy':
        method: 'DELETE'
        params: id: '@id'
      'update':
        method:'PATCH'
        params:
          id: '@id'
          text: '@text'

]