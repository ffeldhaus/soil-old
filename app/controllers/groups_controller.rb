class GroupsController < ApplicationController
  def index
    @group = Group.includes(:rounds => :decision).all
    respond_to do |format|
      format.json { render :json => @group, :include => {:rounds => {:include => {:decision => {}, :result => {:include => {:income => {:include => :harvest},:expense => {:include => [:seed, :investment, :running_cost]}}}}}} }
    end
  end

  def new
    @group = Group.new
  end

  # GET /groups/1.json
  def show
    @group = Group.find_by_id(params[:id])
    @group.wait_for_other_groups = (@group.game.nextRound == @group.rounds.count)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      session[:group_id] = @group.id
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  private
  def group_params
    params.require(:group).permit(:groupname, :password, :password_confirmation)
  end
end