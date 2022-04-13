class PlaceCandidate < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :meetup
  belongs_to :place
end
