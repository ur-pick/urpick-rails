class FriendInvitation < ApplicationRecord
  belongs_to :user

  def self.reacted?(id1, id2)
    case1 = !FriendInvitation.where(user_id: id1, friend_id: id2).empty?
    case2 = !FriendInvitation.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end
  
  def self.confirmed_record?(id1, id2)
    case1 = !FriendInvitation.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = !FriendInvitation.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 || case2
  end

  def self.find_invitation(id1, id2)
    if FriendInvitation.where(user_id: id1, friend_id: id2, confirmed: true).empty?
      FriendInvitation.where(user_id: id2, friend_id: id1, confirmed: true)[0].id
    else
      FriendInvitation.where(user_id: id1, friend_id: id2, confirmed: true)[0].id
    end
  end
end
