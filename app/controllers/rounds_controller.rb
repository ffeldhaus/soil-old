class RoundsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update]

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

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    @round = Round.find_by_id(params[:id])
    respond_to do |format|
      puts round_params
      if @round.update_attributes(round_params)
        format.json { head :no_content }
      else
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def round_params
    params.permit(:number, field_attributes: [:id,parcels_attributes: [:id, :nutrition,:soil,:cropsequence,:harvest,:plantation]],decision_attributes: [:id,:machines,:organic,:pesticide,:fertilize,:organisms])
  end
end
