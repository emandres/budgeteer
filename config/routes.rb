Budgeteer::Application.routes.draw do
  resources :budgets do
    resources :revenues, controller: 'budget_items', only: [:new, :create, :destroy]
    resources :expenses, controller: 'budget_items', only: [:new, :create, :destroy]
  end

  resources :accounts
  resources :expense_accounts, controller: 'accounts'
  resources :revenue_accounts, controller: 'accounts'

  resources :budget_templates
  put "/budget_templates/:id/add_account" => "budget_templates#add_account"
end
