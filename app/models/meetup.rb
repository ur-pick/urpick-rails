class Meetup < ApplicationRecord
  has_many :invites
  has_many :users, through: :invites
  has_many :places
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  accepts_nested_attributes_for :invites, allow_destroy: true,
                                          :reject_if => proc { |att| att[:user_id].blank? }

  def voting_results
    mapped_places = {}
    highest_count = -1
    most_voted = []
    places.each do |place|
      current_vote_count = place.votes.count
      if current_vote_count > highest_count
        highest_count = current_vote_count
        most_voted = [place.name]
      elsif current_vote_count == highest_count
        most_voted.push(place.name)
      end
    end
    most_voted
  end
end
