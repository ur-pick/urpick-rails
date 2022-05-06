class Meetup < ApplicationRecord
  has_many :invites
  has_many :users, through: :invites
  has_many :place_candidates
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  accepts_nested_attributes_for :invites, allow_destroy: true,
                                          :reject_if => proc { |att| att[:user_id].blank? }

  validates_presence_of :title, :date
  validates_length_of :title, in: 2..60
  validate :date_cannot_be_in_past
  
  def voting_results
    mapped_places = {}
    highest_count = -1
    most_voted = []
    # Could Refactor to SQL
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

  private

  def date_cannot_be_in_past
    errors.add(:date, "can't be in the past") if
      !date.blank? and date < Date.today  
end
