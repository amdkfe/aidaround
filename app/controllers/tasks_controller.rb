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
    
  end

  def update
    @task = Task.find(params[:id])
    @tasklist = Task.find_by id: @task.id
    i = current_user.id
    # @task.assignee_id = current_user.id
    @task.update_attribute(:assignee_id, i)
    @assignee = User.find_by id: @task.assignee_id
    redirect_to task_path(@tasklist.id)

  #   respond_to do |format|
  #   flash[:success] = "Calendar updated"
  #   format.html { redirect_to root_path }
  #   format.js
  # end
  end

  private
  def task_params
    params.require(:task).permit(:title, :title_icon, :desc, :description, :duration, :images, :address, :latitude, :longitude, :owner_id, :status, :type, :assignee_id, :points, :user_id)
  end
  
end

