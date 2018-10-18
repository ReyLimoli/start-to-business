class Invite < ApplicationRecord
  validates :name, :linkedin, :email, presence: true
end
