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

  def show
    @task = Task.find(params[:id])
    @creator = User.find_by id: @task.owner_id
    @assignee = User.find_by id: @task.assignee_id
    # @task = @user.owned_tasks
  end

  private
  def task_params
    params.require(:task).permit(:title, :title_icon, :desc, :description, :duration, :images, :address, :latitude, :longitude, :owner_id, :status, :type, :assignee_id, :points, :user_id)
  end


  def preview
    @user = User.find(params[:id])
    @task = Task.find_by(task_id: params[:task_id])
    # @post = Post.find_by(slug: params[:slug])
  end
end

