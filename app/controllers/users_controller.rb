class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    id = current_user.id
    @user = User.find_by(current_user.id)
  end
end
