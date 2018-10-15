class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end
   
  def create
    @idea = Idea.new(idea_params)
   
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
  end
   
  private
    def idea_params
      params.require(:idea).permit(:title, :description, :estimated_project_time, :initial_investment_value, :estimated_time_to_profit)
    end
end
