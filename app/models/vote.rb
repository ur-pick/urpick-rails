class Vote < ApplicationRecord
  belongs_to :place_candidate
  belongs_to :invite

  before_create :not_voted?

  private

  def not_voted?
    Vote.where(place_candidate: self.place_candidate, invite: self.invite).empty?
  end
end
