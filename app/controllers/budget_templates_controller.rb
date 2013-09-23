class BudgetTemplatesController < ApplicationController
  before_filter :set_budget_template, only: [:edit, :update, :show, :destroy]
  respond_to :html

  def index
    @budget_templates = BudgetTemplate.all
    respond_with @budget_templates
  end
  
  def show
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

  end


  private
  def set_budget_template
    @budget_template = BudgetTemplate.find(params[:id])
  end

  def budget_template_params
    params.require(:budget_template).permit(:name)
  end
end
