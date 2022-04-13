class RemoveFieldsFromPlaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :is_chosen, :boolean
    remove_reference :places, :meetup, null: false, foreign_key: true
  end
end
