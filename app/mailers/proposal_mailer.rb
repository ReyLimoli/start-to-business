class ProposalMailer < ApplicationMailer
  def notify_idealizer(idea_id, proposal_id)
    @proposal = Proposal.find(proposal_id)
    @idea = Idea.find(idea_id)
    mail(to: @idea.user.email, subject: 'Sua idéia recebeu uma proposta')
  end
end
