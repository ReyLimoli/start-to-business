class IdeasController < ApplicationController
  before_action :authenticate_user!

  def show
    @idea = Idea.find(params[:id])
  end

  def index
    @ideas = Idea.where(user_id: current_user.id)
  end
end
