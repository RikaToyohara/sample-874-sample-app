class TasksController < ApplicationController
  def index
    @user = User.find_by(params[:id])
    @tasks = @user.tasks
  end
end
