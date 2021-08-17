class RocketsController < ApplicationController
  before_action :set_rockets, only: [:index]

  def index
  end

  def show
    @rocket = Rocket.find(params[:id])
  end

  def new
    @rocket = Rocket.new
  end

  def create
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
