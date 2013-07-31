class SupervisorsController < ApplicationController
  before_filter :authorize_supervisor, only: [:edit, :update]
  before_action :set_supervisor, only: [:show, :edit, :update, :destroy]

  def index
    @supervisors = Supervisor.all
    render json: @supervisors
  end

  def show
    @supervisor = Supervisor.find_by_id(params[:id])
    render json: @supervisor
  end

  # POST /games
  # POST /games.json
  def create
    @supervisor = Supervisor.new(supervisor_params)
    if @supervisor.save
      head :no_content
    else
      render json: @supervisor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @supervisor.destroy
      head :no_content
  end

  private

  def set_supervisor
    @supervisor = Supervisor.find(params[:id])
  end

  def supervisor_params
    params.merge! :name => (params[:first_name][0] + params[:last_name]).downcase
    password = SecureRandom.hex(8)
    params.merge! :password => password
    params.merge! :password_confirmation => password
    puts params
    params.permit(:name, :first_name, :last_name, :password, :password_confirmation, :email)
  end

end