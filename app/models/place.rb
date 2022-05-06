class Place < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :place_candidates, dependent: :destroy

  validates_presence_of :latitude, :longitude,
    :address, :name, :description

  validates_numericality_of :latitude, :longitude
end
