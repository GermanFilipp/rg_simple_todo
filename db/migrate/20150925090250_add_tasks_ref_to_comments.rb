class AddTasksRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :task, index: true
  end
end
