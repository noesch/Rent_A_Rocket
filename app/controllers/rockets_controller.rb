class RocketsController < ApplicationController
  before_action :set_rockets, only: [:index]

  def index
    @rocket = policy_scope(Rocket).order(created_at: :desc)
  end

  def show
    @rocket = Rocket.find(params[:id])
    @booking = @rocket.last_booking
    authorize @rocket
  end

  def new
    @rocket = Rocket.new
    authorize @rocket
  end

  def create
    authorize @rocket
    @rocket = Rocket.new(rocket_params)
    if @rocket.save
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  private

  def set_rockets
    @rockets = Rocket.all
  end

  def rocket_params
    params.require(:rocket).permit(:name, :price, :fuel, :description)
  end
end
