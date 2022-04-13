class Place < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :place_candidates, dependent: :destroy
end
