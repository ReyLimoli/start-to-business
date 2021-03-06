class InvitesController < ApplicationController
  before_action :authenticate_user!
  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(params.require(:invite).permit(:name,
                                                        :linkedin, :email))

    if @invite.save
      flash[:notice] = "Obrigado por indicar um investidor \
para nossa plataforma"
      redirect_to @invite
    else
      render 'new'
    end
  end

  def show
    @invite = Invite.find(params[:id])
  end
end
