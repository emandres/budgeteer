class Revenue < BudgetItem
  belongs_to :revenue_account

  def value
    amount
  end
end
