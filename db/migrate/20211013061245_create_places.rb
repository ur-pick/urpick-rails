class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.float :longitude
      t.float :latitude
      t.string :address
      t.boolean :is_chosen
      t.references :meetup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
