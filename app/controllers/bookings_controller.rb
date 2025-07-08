class BookingsController < ApplicationController
  before_action :set_van

  def new
    @booking = @van.bookings.new
  end

  private

  def set_van
    @van = Van.find(params[:van_id])
  end
end
