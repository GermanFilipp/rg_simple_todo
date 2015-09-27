controllers = angular.module('todo_list')


controllers.controller 'CommentsController', [
  '$scope'
  '$http'
  'Comments'
  'Comment'
  ($scope,$http,Comments,Comment) ->
    $scope.createComment = (task_id) ->
      Comments.create {
          task_id: task_id
          text: $scope.commentName
        }, (res) ->
        $scope.commentName = ''
        $scope.task.comments.push res.comment

    $scope.deleteComment = (id,key) ->
      Comment.destroy {id:id}, (res) ->
        $scope.task.comments.splice key, 1

    $scope.updateComment = (value, id) ->
      Comment.update {id: id, text: value }, ->
      return value
]
