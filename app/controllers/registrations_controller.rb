class RegistrationsController < Devise::RegistrationsController

  #created this controller and method to override devise behaviour and 
  #route to the desired path from devise's sign up button
  protected

  def after_sign_up_path_for(resource)
    @user = User.new(params[:id])
    session[:user_id] = current_user.id
    '/sign_up/upload_avatar'
  end

end