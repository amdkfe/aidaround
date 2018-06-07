class AfterSignupController < ApplicationController
  
  respond_to :html, :js

  #created controller to set the actions and views of the multi pages after 
  #the signup form and used the Wicked gem to define steps and next paths 
  include Wicked::Wizard

  steps :upload_avatar, :add_postcode, :welcome

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    respond_to do |format|
      format.html
      format.json
    end

    render_wizard  @user
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :postcode, :avatar)
  end

end
