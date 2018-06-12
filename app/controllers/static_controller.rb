class StaticController < ApplicationController
  def index
    @assignees = Assignee.all
    # @creator = current_user
  end
 end