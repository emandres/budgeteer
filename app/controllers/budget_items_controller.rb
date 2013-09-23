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
    @budget_item = new_budget_item(budget_item_params)
    @budget.budget_items << @budget_item
    
    if @budget_item.save
      redirect_to @budget
    else
      render 'new'
    end
  end

  def destroy
    b = BudgetItem.find(params[:id])
    b.destroy
    redirect_to budget_path(b.budget)
  end

  private
  def new_budget_item(args = {})
    type_class.new(args)
  end

  def budget_item_params
    params.require(type_sym).permit(:name, :amount)
  end

  def set_type
    @type = request.original_url.match(/(expense|revenue)/)[1]
  end

  def type_class
    Object.const_get(@type.camelize)
  end

  def type_sym
    @type.to_sym
  end
end
