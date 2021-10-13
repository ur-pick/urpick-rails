class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.integer    :status, null: false, default: 1
      t.references :user, null: false, foreign_key: true
      t.references :meetup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
