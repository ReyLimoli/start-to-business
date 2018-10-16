class HomeController < ApplicationController
  def index
    if user_signed_in? && !current_user.amount_available_to_invest.nil?
      @ideas = Idea.all
    elsif user_signed_in?
      @ideas = current_user.ideas
    end
  end
end
