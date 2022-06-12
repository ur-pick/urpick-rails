class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    binding.pry
    found_user?
  end

  def create?
    found_user?
  end

  private

  def found_user?
    # A meetup has invites (connected to user)
    # Filter through invites and see if current_user is apart of that invite
    !record.meetup.users.where(id: user.id).empty? || record.meetup.owner.present?
  end
end
