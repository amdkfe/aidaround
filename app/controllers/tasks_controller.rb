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
    if @task.save
      flash[:success] = "You have successfully created a new task!"
      redirect_to created_tasks_user_path(current_user) 
    else
      render action: 'new' 
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :title_icon, :desc, :description, :duration, :images, :address, :latitude, :longitude, :owner_id, :status, :type, :assignee_id, :points, :user_id)
  end

  def show
    @user = User.find(params[:id])
    @task = @user.owned_tasks
  end

  def preview
    @user = User.find(params[:id])
    @task = Task.find(params[:id])
  end
end

