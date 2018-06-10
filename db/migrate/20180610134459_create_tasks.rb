class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :title_icon
      t.text :desc
      t.integer :points
      t.string :images
      t.date :duration
      t.string :status
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      # t.references :contributor, foreign_key: true

      t.timestamps
    end
  end
end
