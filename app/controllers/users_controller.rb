class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    id = current_user.id
    @user = User.find_by(current_user.id)
  end

   def created_tasks
    @user = User.find(params[:id])
    @task = @user.owned_tasks
  end
end
