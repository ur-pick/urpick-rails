class AddMeetupReferencesToVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :votes, :meetup, index: true
    add_foreign_key :votes, :meetups
  end
end
