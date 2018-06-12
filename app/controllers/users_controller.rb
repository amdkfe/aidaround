class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    id = current_user.id
    @user = User.find_by(current_user.id)
  end

   def created_tasks
    # # @user = User.find(params[3])
    # id = current_user.id
    @user = User.find(params[:id])
    # @task = Task.find(params[:id])
    # search for all users tasks with a task id of 7 
    # @task = @user.user_id.find(params[:id])
    @task = @user.owned_tasks
    # render action: 'show', controller: 'user'
  end
end
