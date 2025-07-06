class BookingsController < ApplicationController
  def new
    @booking = @van.bookings.new
  end
end
