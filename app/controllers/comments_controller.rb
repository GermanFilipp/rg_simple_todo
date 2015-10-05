class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @comment.save
      render json: @comment
    else
      render json: { message: I18n.t('comment.error_save') }, status: 200
    end
  end

  def update
    if @comment.update(comment_params)
      render json: { nothing: true }
    else
      render json: { message: I18n.t('comment.error_update') }, status: 200
    end
  end

  def destroy
    @comment.destroy
    render json: { nothing: true }
  end

  def file_attach
    @comment.file_attachments.create!(file: params[:file])
    render json: @comment.file_attachments
  end

  private

  def comment_params
    params.permit(:text, :task_id)
  end

end
