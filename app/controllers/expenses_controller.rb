class ExpensesController < ApplicationController
  before_action :user_signed_check
  before_action :set_group, except: [:top, :update]
  before_action :set_expense, only: [:edit, :show, :update]

  def top
    @groups = GroupUser.where(user_id: current_user.id)
  end

  def index
    @expenses = @group.expenses
  end

  def new
    @expense = Expense.new
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def create
    @expense = Expense.new(expense_params)
    @expense[:year] = @expense[:order_date].strftime("%Y")
    @expense[:month] = @expense[:order_date].strftime("%m")
    @expense[:day] = @expense[:order_date].strftime("%d")
    if @expense.save
      redirect_to group_expenses_path(@group)
    else
      render :index
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to group_expenses_path(@expense.group_id), notice: '経費情報を更新しました'
    else
      render :edit
    end
  end

  def show

  end

  private
  def expense_params
    params.require(:expense).permit(:order_date, :content, :income_spend, :price, :remarks, :receipt_file_name, :receipt_file, :account_no, :group_id).merge(user_id: current_user.id)
    # params.require(:expense).permit(:order_date, :content, :income_spend, :price, :remarks, :receipt_file_name, :account_no, :group_id, receipt_files_attributes:[:id]).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
