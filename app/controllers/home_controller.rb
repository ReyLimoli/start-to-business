class HomeController < ApplicationController
  def about_us; end

  def index
    if user_signed_in?
      redirect_to ideas_path
    end
  end
end
