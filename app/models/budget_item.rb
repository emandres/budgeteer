class BudgetItem < ActiveRecord::Base
  belongs_to :budget

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
  validates :budget, presence: true

  private
  def budget_item_params
    params.require(:budget_item).permit(:name, :amount)
  end
end
