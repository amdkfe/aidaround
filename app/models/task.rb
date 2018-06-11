class Task < ApplicationRecord

  belongs_to :owner, class_name: 'User' , foreign_key: "owner_id"
  belongs_to  :assignee, class_name: 'User', foreign_key: "assignee_id"

  validates_presence_of :user_id, :latitude, :longitude, :points, :title, :status
  
end
