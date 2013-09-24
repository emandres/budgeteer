class Budget < ActiveRecord::Base
  has_many :revenues, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :budget_items, dependent: :destroy
  belongs_to :budget_template
end
