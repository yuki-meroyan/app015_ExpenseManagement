class TasksController < ApplicationController
  before_action :user_signed_check
  before_action :set_group, except: [:top]
  before_action :set_task, only: [:edit, :show]

  def top
    @groups = GroupUser.where(user_id: current_user.id)
  end

  def index
    @tasks = @group.tasks
  end

  def new
    @task = Task.new
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to group_tasks_path(@group)
    else
      render :index
    end
  end

  def update
    if @task.update(task_params)
      redirect_to group_task_path(@task), notice: 'タスク情報を更新しました'
    else
      render :edit
    end
  end

  def show

  end

  private
  def task_params
    params.require(:task).permit(:title, :client_user, :client_name, :detail, :request_date, :delivery_date, :group_id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
