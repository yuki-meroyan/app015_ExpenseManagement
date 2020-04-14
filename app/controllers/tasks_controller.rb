class TasksController < ApplicationController
  def index
  end

  def new
    @task = Tasks.new
  end

  def create
    @task = Beginner.new(beginner_params)
    if @task.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
  end

  private
  def task_params
    params.require(:task).permit(:title, :client_user, :client_name, :detail, :request_date, :delivery_date, :group_id).merge(user_id: current_user.id)
  end

end
