class AddUserRefToProposals < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposals, :user, foreign_key: true
  end
end
