class Idea < ApplicationRecord
  validates :title, :description, :estimated_project_time,
            :initial_investment_value, :estimated_time_to_profit, presence: true
  belongs_to :user
  belongs_to :category

  has_many :proposals, dependent: :nullify
  has_many :investors, dependent: :nullify

  def proposal_from(user)
    proposals.find_by(user: user)
  end
  # proposta de uma idea especifica de um usuario
  has_many :favorite_ideas, dependent: :destroy

  def favorite?(user)
    favorite_ideas.where(user: user, active: true).any?
  end
end
