class AddIdeaRefToProposals < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposals, :idea, foreign_key: true
  end
end
