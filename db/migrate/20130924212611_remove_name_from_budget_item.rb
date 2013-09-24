class RemoveNameFromBudgetItem < ActiveRecord::Migration
  def up
    remove_column :budget_items, :name
  end

  def down
    add_column :budget_items, :name, :string, null: false
  end
end
