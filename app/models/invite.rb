class Invite < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :meetup
end
