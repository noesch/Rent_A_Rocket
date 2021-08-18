class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @rocket = Rocket.find(params[:rocket_id])
  end

  def create
    @booking = Booking.new(status: "pending")
    @booking.rocket = Rocket.find(params[:rocket_id])
    @booking.user = current_user
    if @booking.save
      redirect_to rocket_path(@booking.rocket), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end
end
