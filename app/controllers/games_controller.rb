class GamesController < ApplicationController
  before_action :authorize_player, only: [:show]
  before_action :authorize_supervisor, only: [:index]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    respond_to do |format|
      format.html
      format.json { render :json => @games, :include => [ :supervisor, :players ] }
      #render :json => @player, :include => {:rounds => {:include => {:decision => {}, :result => {:include => {:income => {:include => :harvest},:expense => {:include => [:seed, :investment, :running_cost]}}}}}}

    end

  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @game, :include => [ :players => [ :rounds => [ { :field => [ :parcels ] } , :decision, { :result => [ { :expense => [ :seed, :investment, :running_cost ] } , { :income => [ :harvest ] } ] } ] ] ], root: false }
    end
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new({:name => game_params['name'],:supervisor_id => game_params['supervisor_id']})

    if @game.save!
      head :no_content
    else
      @game.destroy!
      puts @game.errors.full_messages
      render json: @game.errors, status: :unprocessable_entity
    end

    game_params['players'].each do |player|
      @game.players.create(:name => player['name'], :password => player['password'], :password_confirmation => player['password'])
      if @game.save!
        head :no_content
      else
        @game.destroy!
        puts @game.errors.full_messages
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    @supervisor = Supervisor.find_by_id(game_params['supervisor_id'])
    UserMailer.new_game_confirmation(@supervisor,@game).deliver

  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private

  def authorize_player
    unless player?
      if admin?
        redirect_to admin_url, :notice => I18n.t('access_denied')
      elsif supervisor?
        redirect_to games_url, :notice => I18n.t('access_denied')
      else
        redirect_to login_url, :notice => I18n.t('access_denied')
      end
    end
  end

  def authorize_supervisor
    unless supervisor?
      if admin?
        redirect_to admin_url, :notice => I18n.t('access_denied')
      elsif player?
        redirect_to root_url, :notice => I18n.t('access_denied')
      else
        redirect_to login_url, :notice => I18n.t('access_denied')
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    game_id = params[:id]
    game_id ||= current_user.game_id
    @game = Game.find(game_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.permit(:name, :supervisor_id, :players => [ :name, :password] )
  end

end
