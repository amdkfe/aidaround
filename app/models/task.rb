class Task < ApplicationRecord
  before_create :set_tasks_data

  belongs_to :owner, class_name: 'User' , foreign_key: "owner_id"
  belongs_to  :assignee, class_name: 'User', foreign_key: "assignee_id", optional: true


  validates_presence_of :user_id, :latitude, :longitude, :points, :title, :status

  def set_tasks_data
    self.images ||= ''
    self.address ||= ''
    self.title_icon ||= ''
  end
  
end
