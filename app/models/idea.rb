class Idea < ApplicationRecord
  validates :title, :description, :estimated_project_time,
            :initial_investment_value, :estimated_time_to_profit, presence: true
  belongs_to :user

  has_many :proposals, dependent: :nullify

  def proposal_from(user)
    proposals.find_by(user: user)
  end
  # proposta de uma idea especifica de um usuario
end
