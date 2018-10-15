class Idea < ApplicationRecord
  validates :title, :description, :estimated_project_time,
            :initial_investment_value, :estimated_time_to_profit ,presence: true
end
