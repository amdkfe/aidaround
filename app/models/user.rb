class User < ApplicationRecord

  # has_many :tasks
  has_many :owned_tasks, class_name: "Task", foreign_key: "owner_id"
  has_many :assigned_tasks, class_name: "Task", foreign_key: "assignee_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username, :email

  mount_uploader :avatar, AvatarUploader



  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def address
    [street, city, state, country, postcode].compact.join(', ')
  end


  def address_changed?
    attrs = %w(street city state postcode country)
    attrs.any?{|a| send "#{a}_changed?"}
  end

end
