class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    new_after_signup_path
  end

  def after_inactive_sign_up_path_for(resource)
    after_signup_path # Or :prefix_to_your_route
  end

end