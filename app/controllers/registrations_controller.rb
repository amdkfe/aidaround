class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # # @user = User.new(params[:id])
    # session[:user_id] = current_user.id
    # redirect_to after_signup_path
    # # binding.pry
    '/after_signup/add_postcode'

    # redirect_to controller: 'after_signup', action: 'show', id: current_user.id

  end

  def after_inactive_sign_up_path_for(resource)
    after_signup_path # Or :prefix_to_your_route
  end

end