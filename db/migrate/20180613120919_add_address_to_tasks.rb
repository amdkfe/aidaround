class AddAddressToTasks < ActiveRecord::Migration[5.1]
  def change
      add_column :tasks, :street, :string  
      add_column :tasks, :city, :string
      add_column :tasks, :state, :string
      add_column :tasks, :country, :string
      add_column :tasks, :postcode, :string

  end
end
