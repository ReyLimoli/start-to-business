class FavoriteIdeasController < ApplicationController
  before_action :authenticate_user!
  def index
    @fav_ideas = current_user.favorite_ideas.where(active: true)
  end
end
