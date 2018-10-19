class HomeController < ApplicationController
  def about_us; end

  def index
    if user_signed_in? && current_user.investor?
      @ideas = Idea.all
    elsif user_signed_in? && current_user.idealizer?
      @ideas = current_user.ideas
      redirect_to ideas_path
    end
  end
end
