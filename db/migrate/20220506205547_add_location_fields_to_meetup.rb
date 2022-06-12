class AddLocationFieldsToMeetup < ActiveRecord::Migration[6.1]
  def change
    add_column :meetups, :latitude, :float
    add_column :meetups, :longitude, :float
    add_column :meetups, :city, :string
  end
end
