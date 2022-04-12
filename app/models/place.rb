class Place < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :meetup
end
