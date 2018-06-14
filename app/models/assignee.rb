class Assignee < User

 mount_uploader :avatar, AvatarUploader

  validate :avatar_not_changed

     private

  def avatar_not_changed
    if avatar_changed? && self.persisted?
      errors.add(:avatar, "Change of avatar not allowed!")
    end
  end

end
