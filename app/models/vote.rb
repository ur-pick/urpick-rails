class Vote < ApplicationRecord
  belongs_to :place
  belongs_to :user

  before_create :not_voted?

  private

  def not_voted?
    Vote.where(place: place, user: user).empty?
  end
end
