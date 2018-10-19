class ProposalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @idea = Idea.find(params[:idea_id])
    @proposal = Proposal.new
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @proposal = @idea.proposals.new(params.require(:proposal)
      .permit(:investment_type_id, :doubts, :details))
    @proposal.user = current_user
    if @proposal.save
      redirect_to @idea
    else
      render 'new'
    end
  end

  def index
    @proposals = current_user.proposals
  end
end
