class BudgetItemsController < ApplicationController
  before_filter :set_type
  respond_to :html

  def new
    @budget = Budget.find(params[:budget_id])
    @budget_item = new_budget_item()
    respond_with @budget_item
  end

  def create
    @budget = Budget.find(params[:budget_id])
    @budget_item = new_budget_item(params[:budget_item])
    @budget.budget_items << @budget_item
    
    redirect_to @budget
  end

  def destroy
    b = BudgetItem.find(params[:id])
    b.destroy
    redirect_to budget_path(b.budget)
  end

  private
  def new_budget_item(*args)
    Object.const_get(@type.titleize).new(*args)
  end

  def budget_item_params
    params.require(:budget_item).permit(:name, :amount)
  end

  def set_type
    @type = request.original_url.match(/(expense|revenue)/)[1]
  end
end
