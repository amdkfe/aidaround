class AddAssigneeToTasks < ActiveRecord::Migration[5.1]
  def change
    # add_reference :tasks, :assignee_user_id,index: true
    # t.references :teacher, references: :users
  end
end

