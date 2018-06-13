class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title   
      t.string :title_icon, :default => "https://cdn.onlinewebfonts.com/svg/img_167476.png"
      t.text :desc
      t.integer :points
      t.string :images
      t.date :duration
      t.string :status, :default => "Open"
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :type
      t.integer :owner_id
      t.integer :assignee_id, :default => nil
      t.timestamps
    end
  end
end
