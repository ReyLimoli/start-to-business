class HomeController < ApplicationController
  def index
    @ideas = Idea.all
  end
  
end