class AddCoordinatesToMeetups < ActiveRecord::Migration[6.1]
  def change
    add_column :meetups, :longitude, :float
    add_column :meetups, :latitude, :float
    add_column :meetups, :address, :string
  end
end
