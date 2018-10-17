class Proposal < ApplicationRecord
  belongs_to :investment_type
  belongs_to :idea
  belongs_to :user
end
