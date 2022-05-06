class VotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # only create vote if the user has an invite to the meetup
    record.meetup.users.include?(user) || record.meetup.owner == user
  end
end
