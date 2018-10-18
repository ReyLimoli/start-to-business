class FavoriteIdeasController < ApplicationController
  def index
    @fav_ideas = current_user.favorite_ideas.where(active: true)
  end
end
