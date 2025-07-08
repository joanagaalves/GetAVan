class BookingsController < ApplicationController
  before_action :set_van, only: [:new, :create]

  def new
    @booking = @van.bookings.new
  end

  def create
    @booking = @van.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to booking_success_path(van_id: @van.id)
    else
      render :new
    end
  end

  def success
    @van = Van.find(params[:van_id]) if params[:van_id]
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  private

  def set_van
    @van = Van.find(params[:van_id])
  end
end

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
