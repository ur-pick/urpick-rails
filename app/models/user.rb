class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_meetups, class_name: "Meetup"
  has_many :votes, dependent: :destroy
  has_many :invites
  has_many :attending_meetups, through: :invites, source: :meetup
  has_many :friend_invitations
  has_many :pending_invitations, -> { where confirmed: false },
    class_name: "FriendInvitation",
    foreign_key: "friend_id"

  validates_uniquess_of :email
  validates_presence_of :email, :name

  def friends
    friends_sent_invitations = FriendInvitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_got_invitations = FriendInvitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_got_invitations + friends_sent_invitations
    User.where(id: ids)
  end

  def friends_with?(user)
    FriendInvitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def all_meetups
    attending_meetups + owned_meetups
  end
end
