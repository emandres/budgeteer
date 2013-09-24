class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :account

  validates :amount, presence: true, numericality: true
  validates :budget, presence: true
end
