class FavoriteIdeasController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.investor?
      @fav_ideas = current_user.favorite_ideas.where(active: true)
    else
      redirect_to root_path
    end
  end
end
