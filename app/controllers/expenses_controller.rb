class ExpensesController < ApplicationController
  before_action :user_signed_check
  before_action :set_group, except: [:top]
  before_action :set_expense, only: [:edit, :show]

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
    if @expense.save
      redirect_to group_expenses_path(@group)
    else
      render :index
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to group_expense_path(@expense), notice: 'タスク情報を更新しました'
    else
      render :edit
    end
  end

  def show

  end

  private
  def expense_params
    params.require(:expense).permit(:order_date, :year, :month, :day, :content, :income_spend, :price, :remarks, :receipt_file_name, :receipt_file, :account_no, :group_id, :user_id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
