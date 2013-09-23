class BudgetTemplate < ActiveRecord::Base
  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :revenue_accounts, join_table: :accounts_budget_templates
  has_and_belongs_to_many :expense_accounts, join_table: :accounts_budget_templates
end
