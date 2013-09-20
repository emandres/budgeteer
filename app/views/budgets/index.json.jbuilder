json.array!(@budgets) do |budget|
  json.extract! budget, 
  json.url budget_url(budget, format: :json)
end
