class PlacesController < ApplicationController
  def index
    @places = policy_scope(Place)
    @meetup = Meetup.find(params[:meetup_id])
    @city_coords = [@meetup.longitude, @meetup.latitude]
  end

  def show
    @place = Place.find_by(foursquare_id: params[:id])
    # Use Place in DB if exists (If it's been chosen before..).. if not, use Foursquare API
    if @place
      authorize @place
      render template: "places/existing_place"
    else
      authorize Place.new
      render template: "places/foursquare_place"
    end
  end

  private

  def places_params
    params.require(:place).permit(:name, :description, :address)
  end
end
