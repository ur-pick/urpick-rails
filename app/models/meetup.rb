class Meetup < ApplicationRecord
  has_many :invites
  has_many :users, through: :invites
  has_many :places
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  
  accepts_nested_attributes_for :invites,  allow_destroy: true, 
  :reject_if => proc { |att| att[:user_id].blank? }

end
