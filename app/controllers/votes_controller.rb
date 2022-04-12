class VotesController < ApplicationController
  def create
    @vote = Vote.new(votes_params)
    # check here if user has a vote for this place.
    authorize @vote
    @vote.user = current_user
    @place = Place.find(params[:place_id])

    if @vote.save
      flash[:notice] = "You have Voted for #{place.name}"
    end
    redirect_to @place
  end

  private

  def votes_params
    params.require(:votes).permit(:place_id)
  end
end
