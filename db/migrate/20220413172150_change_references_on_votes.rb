class ChangeReferencesOnVotes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :votes, :place, null: false, foreign_key: true
    remove_reference :votes, :user, null: false, foreign_key: true
    add_reference :votes, :place_candidate, null: false, foreign_key: true
    add_reference :votes, :invite, null: false, foreign_key: true
  end
end
