require 'rails_helper'

RSpec.describe ProposalMailer, :type => :mailer do
  describe "notify_idealizer" do

    it "renders the headers" do
      user = create(:user, email: 'joao@email.com')
      idea = create(:idea, title: 'Ideia Legal', user: user)
      investor = create(:user, :investor, email: 'invest@email.com')
      proposal = create(:proposal, idea: idea, user: investor)

      mail = ProposalMailer.notify_idealizer(idea.id, proposal.id)

      expect(mail.subject).to eq("Sua idéia recebeu uma proposta")
      expect(mail.to).to eq(["joao@email.com"])
    end

    it "renders the body" do
      user = create(:user, email: 'joao@email.com')
      idea = create(:idea, title: 'Ideia Legal', user: user)
      investor = create(:user, :investor, email: 'invest@email.com')
      proposal = create(:proposal, idea: idea, user: investor)

      mail = ProposalMailer.notify_idealizer(idea.id, proposal.id)
      expect(mail.body).to include('Sua ideia Ideia legal recebeu uma proposta')
    end
  end
end
