class ResultController < ApplicationController

  before_action :set_round, only: [:show, :edit, :update, :destroy]

  def new
    @field = Field.new
  end

  def show
    render json: @field, root: false
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def field_params
    params.require(:field).permit(:parcels)
  end

end
