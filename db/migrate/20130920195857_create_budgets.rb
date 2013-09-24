class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name
      t.references :budget_template, null: false

      t.timestamps
    end
  end
end
