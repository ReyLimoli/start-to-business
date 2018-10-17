class Proposal < ApplicationRecord
  belongs_to :investment_type
  belongs_to :idea
  belongs_to :user

  validates :investment_type, presence: { message: "Este campo \
não pode ficar nulo"}
end
