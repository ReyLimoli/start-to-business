class IdeasController < ApplicationController
  def index
    @ideas = Idea.where(user_id: current_user.id)
  end

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      flash[:success] = 'Sua ideia foi criada com sucesso!'
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
    @favorite_idea = @idea.favorite_ideas.find_by(user: current_user)
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
end
