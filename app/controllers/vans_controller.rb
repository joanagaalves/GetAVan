class VansController < ApplicationController
  before_action :set_van, only: [:show, :edit, :update, :destroy]

  def index
    @vans = Van.all
    @van = Van.new
  end

  def show
    if params[:from] == "bookings" && params[:booking_id]
      @booking = Booking.find(params[:booking_id])
    end
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user # si tu as une association entre User et Van
    if @van.save
      redirect_to van_path(@van), notice: "Van was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if params[:van][:photos].present?
      @van.photos.attach(params[:van][:photos])
    end

    if @van.update(van_params.except(:photos))
      redirect_to van_path(@van), notice: "Van was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @van.destroy
    redirect_to my_vans_path, notice: "Van was successfully deleted."
  end

  def my_vans
    @vans = current_user.vans
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def van_params
    params.require(:van).permit(:title, :description, :price, :model, :seats, :size, photos: [])
  end
end
