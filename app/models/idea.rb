class Idea < ApplicationRecord
  def estimated_project_time_to_month
    "#{estimated_project_time} meses"
  end

  def estimated_time_to_profit_to_month
    "#{estimated_time_to_profit} meses"
  end

  belongs_to :user
end
