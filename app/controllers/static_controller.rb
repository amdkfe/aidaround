class StaticController < ApplicationController
  def index
    @assignees = Assignee.all
    @tasks = Task.all
    # @task = Task.page(params[:page]).per(5)
    # @creator = current_user
  end
 end