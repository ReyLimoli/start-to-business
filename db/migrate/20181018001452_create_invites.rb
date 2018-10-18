class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :name
      t.string :linkedin
      t.string :email

      t.timestamps
    end
  end
end
