class MeetupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # filter to only include meetups that a user is attending, invited to, or
      user.all_meetups
    end
  end

  def show?
    is_owner? || record.users.include?(user)
  end

  def create?
    true
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    record.owner == user
  end
end
