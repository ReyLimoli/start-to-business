class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.text :doubts
      t.text :details
      t.references :investment_type, foreign_key: true

      t.timestamps
    end
  end
end
