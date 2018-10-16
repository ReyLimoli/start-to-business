class Idea < ApplicationRecord
  belongs_to :user
  has_many :investors, dependent: :nullify
end
