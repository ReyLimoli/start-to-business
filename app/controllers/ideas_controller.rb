class IdeasController < ApplicationController
    def index
        @ideas = Idea.where(user_id: current_user.id)
    end
end