controllers = angular.module('todo_list')


controllers.controller 'CommentsController', [
  '$scope'
  '$http'
  'Comments'
  'Comment'
  'ngToastFactory'
  ($scope,$http,Comments,Comment, ngToastFactory) ->
    $scope.createComment = (task_id,isValid) ->
      if isValid
        Comments.create {
            task_id: task_id
            text: $scope.commentName
          }, (res) ->
          $scope.commentName = ''
          $scope.task.comments.push res.comment
        ngToastFactory.successToast('Comment successfully created')
      else
        ngToastFactory.alertToast("Comment name can't be blank")


    $scope.deleteComment = (id,key) ->
      Comment.destroy {id:id}, (res) ->
        $scope.task.comments.splice key, 1
        ngToastFactory.successToast('Comment successfully deleted')

    $scope.updateComment = (value, id) ->
      Comment.update {id: id, text: value }, ->
        ngToastFactory.successToast('Comment successfully updated')
      return true
]
