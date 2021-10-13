class RemoveAddressFromMeetups < ActiveRecord::Migration[6.1]
  def change
    remove_column :meetups, :address
  end
end
