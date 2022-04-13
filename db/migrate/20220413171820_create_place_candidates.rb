class CreatePlaceCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :place_candidates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meetup, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.boolean :is_chosen, null: false, default: false

      t.timestamps
    end
  end
end
