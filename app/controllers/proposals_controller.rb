class ProposalsController < ApplicationController
  before_action :authenticate_user!

  def index
    return @proposals = current_user.proposals if current_user.investor?

    @proposals = Proposal.where(idea: current_user.ideas)
  end

  def new
    @idea = Idea.find(params[:idea_id])
    @proposal = Proposal.new
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @proposal = @idea.proposals.new(proposal_params)
    if @proposal.save
      ProposalMailer.notify_idealizer(@idea.id, @proposal.id)
      redirect_to @idea
    else
      render 'new'
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:investment_type_id, :doubts, :details)
          .merge(user: current_user)
  end
end
