class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :description
      t.integer :estimated_project_time
      t.decimal :initial_investment_value
      t.integer :estimated_time_to_profit

      t.timestamps
    end
  end
end
