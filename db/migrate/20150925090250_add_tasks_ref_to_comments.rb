class AddTasksRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :task, index: true, foreign_key: true
  end
end
