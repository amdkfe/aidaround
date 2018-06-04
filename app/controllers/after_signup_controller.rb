class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_postcode, :upload_avatar

  def show
     @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    render_wizard  @user
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :postcode)
  end

end
