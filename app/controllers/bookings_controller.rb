class BookingsController < ApplicationController

  skip_after_action :verify_policy_scoped, only: :index
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    @rocket = Rocket.find(params[:rocket_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(status: "pending")
    @booking.rocket = Rocket.find(params[:rocket_id])
    authorize @booking
    @booking.user = current_user
    if @booking.save
      redirect_to rocket_path(@booking.rocket), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    @booking.save
    redirect_to rocket_path(@booking.rocket)
    authorize @booking
  end

end
