class AddReferencesToVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :votes, :user, null: false, foreign_key: true
  end
end
