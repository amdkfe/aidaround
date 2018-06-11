class AddOwnerToTasks < ActiveRecord::Migration[5.1]
  def change
    # add_reference :tasks, :owner, foreign_key: true
  end
end
