class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_postcode, :upload_avatar

  def show
    @user = user
    render_wizard
  end

  def update
    @user = user
    @user.update_attributes(params[:user])
    render_wizard @user
  end

end
