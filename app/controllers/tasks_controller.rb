class TasksController < ApplicationController

  def index
    @user = User.find(params[:id])
    @task = @user.owned_tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
    @user = User.all
    if @task.save
      flash[:success] = "You have successfully created a new task!"
      redirect_to controller: 'users', action: 'created_tasks' 
    else
      render action: 'new' 
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :title_icon, :desc, :description, :duration, :images, :address, :latitude, :longitude, :owner_id, :status, :type, :assignee_id, :points, :user_id)
  end

  def show
    # # @user = User.find(params[3])
    # id = current_user.id
    @user = User.find(params[:id])
    # @task = Task.find(params[:id])
    # search for all users tasks with a task id of 7 
    # @task = @user.user_id.find(params[:id])
    @task = @user.owned_tasks
    # render action: 'show', controller: 'user'
  end

  def preview
        # # @user = User.find(params[3])
    # id = current_user.id
    @user = User.find(params[:id])
    # @task = Task.find(params[:id])
    # search for all users tasks with a task id of 7 
    # @task = @user.user_id.find(params[:id])
    @task = Task.find(params[:id])
    # render action: 'show', controller: 'user'
  end
end

