class RemoveCoordinatesFromMeetup < ActiveRecord::Migration[6.1]
  def change
    remove_column :meetups, :longitude
    remove_column :meetups, :latitude
  end
end
