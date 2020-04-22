class TasksController < ApplicationController
  before_action :set_user

  
  def index
    @tasks = @user.tasks
  end
  
  def show
    @task = @user.tasks
  end
  
  def new
    @task = @user.tasks
  end
  
  def create
    @tasks = @user.tasks.build(task_params)
    if @tasks.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url @user
  end
  
  
  private
  
  def task_params
      params.require(:task).permit(:name, :description)
  end
  
  def set_user
      @user = User.find(params[:user_id])
  end
  
end
