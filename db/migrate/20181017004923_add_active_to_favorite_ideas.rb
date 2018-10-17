class AddActiveToFavoriteIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :favorite_ideas, :active, :boolean, default: true
  end
end
