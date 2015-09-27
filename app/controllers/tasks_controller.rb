class TasksController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @tasks
  end

  def create
    if @task.save
      render json: @task
    else
      render json: { message: I18n.t('task_list.error_save') }, status: 200
    end
  end

  def update
    if @task.update(task_params)
      render json: { nothing: true }
    else
      render json: { message: I18n.t('task_list.error_update') }, status: 200
    end
  end

  def destroy
    @task.destroy
    render json: @task
  end

  private

  def task_params
    params.permit(:status, :title, :deadline, :position, :project_id)
  end

end
