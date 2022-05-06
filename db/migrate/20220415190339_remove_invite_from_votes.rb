class RemoveInviteFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :votes, :invite, null: false, foreign_key: true
  end
end
