class AddCategoriesToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :categories, null: true, foreign_key: true
  end
end
