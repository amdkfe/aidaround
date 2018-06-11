class TasksController < ApplicationController

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
    if @task.save
      flash[:success] = "You have successfully created a new task!"
      redirect_to @task
    else
      render action: 'new' 
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :title_icon, :desc, :description, :duration, :images, :address, :latitude, :longitude, :owner_id, :status, :type, :assignee_id, :points, :user_id)
  end

  def show
    # @user = User.find(params[3])
    id = current_user.id
    @user = OwnedUser.last
    @task = Task.find(params[:id])
  end
end

