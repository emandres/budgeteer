class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.references :budget, index: true
      t.references :account, index: true
      t.string :type

      t.timestamps
    end
  end
end
