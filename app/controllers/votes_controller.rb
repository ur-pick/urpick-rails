class VotesController < ApplicationController
  def create
    @vote = Vote.new()

    @place_candidate = PlaceCandidate.find(params[:place_candidate_id])
    @vote.place_candidate = @place_candidate
    @vote.user = current_user
    @vote.meetup = @place_candidate.meetup
    authorize @vote
    # check here if user has a vote for this place.
    if @vote.save!
      flash[:notice] = "You have Voted for #{@place_candidate.place.name}"
    end
    redirect_to @place_candidate.meetup
  end
end
