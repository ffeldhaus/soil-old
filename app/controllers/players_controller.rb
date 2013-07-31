class PlayersController < ApplicationController
  def index
    @player = Player.includes(:rounds => :decision).all
    render :json => @player, :include => {:rounds => {:include => {:decision => {}, :result => {:include => {:income => {:include => :harvest},:expense => {:include => [:seed, :investment, :running_cost]}}}}}}
  end

  def new
    redirect_to login_url, alert: "Not authorized" unless authorized?
    @player = Player.new
  end

  # GET /players/1.json
  def show
    @player = Player.find_by_id(params[:id])
    render json: @player
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      session[:player_id] = @player.id
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  private
  def player_params
    params.require(:player).permit(:name, :password, :password_confirmation)
  end

  def authorized?
    Supervisor.find(session[:supervisor_id]) if session[:player_id]
  end

end