class Task < ApplicationRecord

  belongs_to :owner, class_name: 'User' , foreign_key: "owner_id"
  belongs_to  :assignee, class_name: 'User', foreign_key: "assignee_id", optional: true


  validates_presence_of :user_id, :latitude, :longitude, :points, :title, :status

  after_initialize :set_tasks_data

  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}
  scope :sorted, lambda {order("position ASC")}
  scope :newest, lambda {order("created_at DESC")}
  scope :search, lambda {|query| where(["latitude LIKE ?", "%#{query}%"])}


  private

  def set_tasks_data
    self.images ||= ''
    self.address ||= ''
    self.title_icon ||= ''
  end
  
end
