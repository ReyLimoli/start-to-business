class Invite < ApplicationRecord
  validates :name, :linkedin, :email, presence: true
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on:
            :create, message: 'Email inválido' }
end
