class VansController < ApplicationController
  def index
    @vans = Van.all
  end

  def show
    @van = Van.find(params[:id])
  end

  def destroy
    @van = Van.find(params[:id])
    @van.destroy
    redirect_to vans_path, notice: "Le van a bien été supprimé."
  end
end
