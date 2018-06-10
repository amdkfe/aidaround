class Task < ApplicationRecord
  belongs_to :user
  # belongs_to :aider

  validates_presence_of :user_id, :latitude, :longitude, :points, :title, :status
  
end
