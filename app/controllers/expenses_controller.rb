class ExpensesController < ApplicationController
  before_action :user_signed_check
  before_action :set_group, except: [:top, :update, :download]
  before_action :set_expense, only: [:edit, :show, :update, :download]

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
    check_text = check_params(@expense)
    if check_text.blank?
      @expense[:year] = @expense[:order_date].strftime("%Y")
      @expense[:month] = @expense[:order_date].strftime("%m")
      @expense[:day] = @expense[:order_date].strftime("%d")
      if @expense.save
        redirect_to group_expenses_path(@group)
      else
        render :new, notice: '経費の作成に失敗しました'
      end
    else
      flash.now[:alert] = check_text
      render :new
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

  def download
    file_name = @expense.receipt_file.identifier
    file_path = Rails.root.join('public', @expense.receipt_file.file.file)
    stat = File::stat(file_path)
    send_file(file_path, filename: file_name, length: stat.size)
  end

  private
  def expense_params
    params.require(:expense).permit(:order_date, :content, :income_spend, :price, :remarks, :receipt_file_name, :receipt_file, :account_id, :group_id).merge(user_id: current_user.id)
    # params.require(:expense).permit(:order_date, :content, :income_spend, :price, :remarks, :receipt_file_name, :account_id, :group_id, receipt_files_attributes:[:id]).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def check_params(expense)
    text = nil
    expense.order_date.blank? ? text = "#{text}[作成日]" : ""
    expense.content.blank? ? text = "#{text}[内容]" : ""
    expense.income_spend.blank? ? text = "#{text}[収入・支出]" : ""
    expense.price.blank? ? text = "#{text}[金額]" : ""
    expense.account_id.blank? ? text = "#{text}[勘定科目]" : ""
    text != nil ? text = "#{text}を入力してください" : ""
    return text
  end

end
