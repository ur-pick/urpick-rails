class AddFoursquareIdToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :foursquare_id, :string, null: false, 
  end
end
