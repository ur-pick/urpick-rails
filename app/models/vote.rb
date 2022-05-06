class Vote < ApplicationRecord
  belongs_to :place_candidate
  belongs_to :meetup
  belongs_to :user
  # has user voted for this meetup?
  validates_uniqueness_of :user, scope: :meetup
  def self.has_voted?(meetup, user)
    Vote.where(meetup: meetup, user: user).exists?
  end

  private
end
