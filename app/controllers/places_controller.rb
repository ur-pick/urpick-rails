class PlacesController < ApplicationController
  def index
    @places = policy_scope(Place)
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
  end

  private

  def places_params
    params.require(:place).permit(:name, :description, :address)
  end
end
