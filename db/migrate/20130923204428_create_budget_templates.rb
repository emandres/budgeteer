class CreateBudgetTemplates < ActiveRecord::Migration
  def change
    create_table :budget_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
