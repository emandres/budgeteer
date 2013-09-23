class Expense < BudgetItem
  belongs_to :expense_account

  def value
    -amount
  end
end
