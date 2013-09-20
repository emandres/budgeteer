Budgeteer::Application.routes.draw do
  resources :budgets do
    resources :revenues, controller: 'budget_items', only: [:new, :create, :destroy]
    resources :expenses, controller: 'budget_items', only: [:new, :create, :destroy]
  end
end
