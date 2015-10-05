controllers = angular.module('todo_list')

controllers.controller 'UploadController', [
  '$scope'
  'Upload'
  '$timeout'
  ($scope,Upload,$timeout) ->

    $scope.uploadFiles = (files, comment_id) ->
      $scope.files = files
      angular.forEach files, (file) ->
        if file and !file.$error
          file.upload = Upload.upload(
            url: '/comments/' + comment_id + '/file_attach'
            file: file)
        file.upload.then ((response) ->
          file.result = response.data
          aray = response.data.comments
          $scope.comment.file_attachments.push(aray[aray.length - 1 ])
        ), (response) ->
          if response.status > 0
            $scope.errorMsg = response.status + ': ' + response.data
        file.upload.progress (evt) ->
          file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total))

]