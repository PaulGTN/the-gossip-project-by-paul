class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:edit, :new, :create, :show]

  def index
    @gossips = Gossip.all
  end
  
  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id]) 
    @user = @gossip.user
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title],'content' => params[:content], 'user' => current_user)
    if @gossip.save
      flash[:success] = "Ton Gossip a bien été enregistré"
      redirect_to root_path 
    else
      render 'new'
    end 
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end 

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @gossip_params = params.permit(:title, :content)
    if @gossip.update(gossip_params)  
      redirect to gossip_path(params[:id])
    else
      render 'edit'
    end 
  end 

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path flash[:success] = "Plus personne ne verra cette horreur !"
  end 

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi d'abord"
      redirect_to new_session_path
    end
  end

end
