class IdeasController < ApplicationController
  before_action :check_investor, only: [:index, :new]
  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      flash[:notice] = 'Sua ideia foi criada com sucesso!'
      redirect_to @idea
    else
      flash[:alert] = 'Preencha todos os campos!'
      render 'new'
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @proposal = @idea.proposal_from(current_user)
  end

  def favorite
    @idea = Idea.find(params[:id])
    @favorite_idea = FavoriteIdea.new(idea: @idea, user: current_user)
    @favorite_idea.save
    redirect_to idea_path(@idea)
  end

  def unfavorite
    @idea = Idea.find(params[:id])
    @favorite_idea = @idea.favorite_ideas.find_by(user: current_user,
                                                  active: true)
    @favorite_idea.active = false
    @favorite_idea.save
    redirect_to idea_path(@idea)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :estimated_project_time,
                                 :initial_investment_value,
                                 :estimated_time_to_profit,
                                 :category_id)
  end

  def check_investor
    if !current_user || current_user.investor?
      redirect_to root_path
    end
  end
end
