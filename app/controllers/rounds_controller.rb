class RoundsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    @round = Round.all
  end

  def new
    @round = Round.new
  end

  # GET /groups/1.json
  def show
    @round = Round.find_by_id(params[:id])
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to root_url, :notice => "New round created!"
    else
      render "new"
    end
  end

  private
  def round_params
    params.require(:round).permit(:number)
  end
end
