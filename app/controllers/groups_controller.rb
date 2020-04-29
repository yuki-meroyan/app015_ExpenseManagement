class GroupsController < ApplicationController
  before_action :user_signed_check
  before_action :set_group        , only: [:show, :edit, :update]

  def index
    @groups = GroupUser.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def show
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループ情報を更新しました'
    else
      render :edit
    end
  end

  protected

  def group_params
    # params.require(:group).permit(:name, :master_user, :password, :password_confirmation, :icon, { user_ids: [] } )
    params.require(:group).permit(:name, :master_user, :icon, { user_ids: [] } )
  end

  def set_group
    @group = Group.find(params[:id])
  end

end

