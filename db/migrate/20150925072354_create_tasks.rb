class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :status
      t.integer :position
      t.datetime :deadline
      t.timestamps null: false
    end
  end
end
