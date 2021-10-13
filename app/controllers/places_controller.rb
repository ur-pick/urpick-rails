class PlacesController < ApplicationController

  def show
  @place = Place.find(params[:id])
  authorize @place
  end
  def new
    @meetup = Meetup.find(params[:meetup_id])
    @place = @meetup.places.build
    authorize @place
  end

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @place = @meetup.places.build(places_params)

    if @place.save
      flash[:notice] = "Created Place #{@place.name}"
      redirect_to @place
    else
      flash[:alert] = "Could Not Create Place."
      render :new
    end
    authorize @place
  end

  private
  
  def places_params
    params.require(:place).permit(:name, :description, :address)
  end
end
