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
    @task = Task.find_by(owner_id: params[:id])
    if @task
      @creator = User.find_by id: @task.owner_id
      @assignee = User.find_by id: @task.assignee_id
      @tasklist = Task.find_by id: @task.id 
    else
      flash[:alert] = "#{@user.username.capitalize} does not have any tasks!"
      redirect_to user_path
    end
  end

  def assigned_tasks
    @user = User.find(params[:id])
    @task = Task.find_by(assignee_id: params[:id])
    if @task 
      @creator = User.find_by id: @task.owner_id
      @assignee = User.find_by id: @task.assignee_id
      @tasklist = Task.find_by id: @task.id 
    else
      flash[:alert] = "#{@user.username.capitalize} is not assigned to any tasks!"
      redirect_to user_path
    end
  end
end
