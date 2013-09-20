class Budget < ActiveRecord::Base
  has_many :revenues
  has_many :expenses
  has_many :budget_items
end
