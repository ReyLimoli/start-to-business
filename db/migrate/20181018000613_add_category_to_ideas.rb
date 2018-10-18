class AddCategoryToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ideas, :category, foreign_key: true
  end
end
