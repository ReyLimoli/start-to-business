class CreateFavoriteIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_ideas do |t|
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
