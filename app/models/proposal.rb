class Proposal < ApplicationRecord
  belongs_to :investment_type
  belongs_to :idea
  belongs_to :user

  def idea_from
    idea
  end
end
