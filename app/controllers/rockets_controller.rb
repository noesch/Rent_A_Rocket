class RocketsController < ApplicationController
  before_action :set_rockets, only: [:index]

  def index
    @rocket = policy_scope(Rocket).order(created_at: :desc)

    @markers = @rocket.geocoded.map do |rocket|
      {
        lat: rocket.latitude,
        lng: rocket.longitude,
        info_window: render_to_string(partial: "info_window", locals: { rocket: rocket }),
        image_url: helpers.asset_url('saucer.gif')
      }
    end
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
    @rocket = Rocket.new(rocket_params)
    @rocket.user = current_user
    authorize @rocket
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
    params.require(:rocket).permit(:name, :price, :fuel, :description, :address, :photo)
  end
end
