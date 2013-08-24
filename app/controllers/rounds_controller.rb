  class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]


  def index
    @rounds = Player.find(params[:player_id]).rounds
    render json: @rounds.to_json
  end

  def show
    render json: @round, root: false
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    @game = Game.find(params[:game_id])

    puts @round.field.parcels.to_json

    if @round.update_attributes(round_params)
      puts @round.field.parcels.to_json
      puts "before start new round"
      @game.start_new_round
      puts "after start new round"
      head :no_content
    else
      render json: @round.errors, status: :calculating_next_round_failed
    end
  end

  private

  def set_round
    @round = Round.find_by_id(params[:id])
  end

  def round_params
    params["submitted"] = true
    if params.has_key? :field
      params[:field_attributes] = params.delete(:field)
      params[:field_attributes][:parcels_attributes] = params[:field_attributes].delete(:parcels) if params[:field_attributes].has_key? :parcels
    end
    params[:decision_attributes] = params.delete(:decision) if params.has_key? :decision
    params.permit(:number, :submitted, field_attributes: [:id, parcels_attributes: [:id, :nutrition, :soil, :cropsequence, :harvest, :plantation]], decision_attributes: [:id, :machines, :organic, :pesticide, :fertilize, :organisms])
  end


end
