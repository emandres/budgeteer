class CreateAccountsBudgetTemplates < ActiveRecord::Migration
  def change
    create_table :accounts_budget_templates, id: false do |t|
      t.integer :account_id, null: false
      t.integer :budget_template_id, null: false
    end
  end
end
