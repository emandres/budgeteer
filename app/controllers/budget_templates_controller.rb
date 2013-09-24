class BudgetTemplatesController < ApplicationController
  before_filter :set_budget_template, only: [:edit, :update, :show, :destroy, :add_account]
  respond_to :html

  def index
    @budget_templates = BudgetTemplate.all
    respond_with @budget_templates
  end
  
  def show
    @expense_accounts = ExpenseAccount.all.reject{ |a| @budget_template.expense_accounts.include? a }.sort_by(&:name)
    @revenue_accounts = RevenueAccount.all.reject{ |a| @budget_template.revenue_accounts.include? a }.sort_by(&:name)

    respond_with @budget_template
  end

  def new
    @budget_template = BudgetTemplate.new
    respond_with @budget_template
  end

  def create
    @budget_template = BudgetTemplate.new(budget_template_params)
    if @budget_template.save
      redirect_to @budget_template
    else
      render 'new'
    end
  end

  def edit
    respond_with @budget_template
  end

  def update
    if @budget_template.update_attributes(budget_template_params)
      redirect_to @budget_template
    else
      render 'edit'
    end
  end

  def destroy
    @budget_template.destroy
    redirect_to budget_templates_path
  end

  def add_account
    @budget_template.accounts << Account.find(params[:account_id])
    redirect_to @budget_template
  end

  private
  def set_budget_template
    @budget_template = BudgetTemplate.find(params[:id])
  end

  def budget_template_params
    params.require(:budget_template).permit(:name)
  end
end
