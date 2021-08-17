class BookingsController < ApplicationController

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
