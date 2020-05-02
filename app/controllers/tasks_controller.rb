class TasksController < ApplicationController
  before_action :user_signed_check
  before_action :set_group, except: [:top, :update]
  before_action :set_task, only: [:edit, :show, :update]

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
    check_text = check_params(@task)
    if check_text.blank?
      if @task.save
        redirect_to group_tasks_path(@group)
      else
        render :new, notice: 'タスクの作成に失敗しました'
      end
    else
      # redirect_to new_group_task_path, notice: check_text
      flash.now[:alert] = check_text
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to group_tasks_path(@task.group_id), notice: 'タスク情報を更新しました'
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

  def check_params(task)
    text = nil
    task.title.blank? ? text = "#{text}[タイトル]" : ""
    task.client_user.blank? ? text = "#{text}[クライアント担当者名]" : ""
    task.client_name.blank? ? text = "#{text}[クライアント企業名]" : ""
    task.request_date.blank? ? text = "#{text}[依頼日]" : ""
    task.delivery_date.blank? ? text = "#{text}[納期]" : ""
    text != nil ? text = "#{text}を入力してください" : ""
    return text
  end

end
