class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(params.require(:invite).permit(:name,
                                                        :linkedin, :email))

    if @invite.save
      flash[:success] = "Obrigado por indicar um investidor \
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
