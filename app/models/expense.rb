class Expense < BudgetItem
  def value
    -amount
  end
end
