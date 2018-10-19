class InvestorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @investors = User.where.not(amount_available_to_invest: nil,
                                id: current_user)
  end

  def show
    @investor = User.find(params[:id])
  end
end
