class VansController < ApplicationController
  before_action :set_van, only: [:show, :edit, :update]

  def index
    @vans = Van.all
  end

  def show
  end

  def edit
  end

  def update
    @van.update(van_params)
    redirect_to van_path(@van), notice: "Van was successfully updated."
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

<<<<<<< HEAD
  def destroy
    @van = Van.find(params[:id])
    @van.destroy
    redirect_to vans_path, notice: "Le van a bien été supprimé."
=======
  def van_params
    params.require(:van).permit(:title, :description, :price, :model, :seats, :size, photos: [])
>>>>>>> a744bbfc34a5631d0a30a85c8087d95db6b5d936
  end
end
