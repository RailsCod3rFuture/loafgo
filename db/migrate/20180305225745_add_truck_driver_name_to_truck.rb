class AddTruckDriverNameToTruck < ActiveRecord::Migration[5.1]
  def change
    add_column :trucks, :truck_driver_name, :string
    add_column :trucks, :current_street_address, :string
    add_column :trucks, :current_state, :string
    add_column :trucks, :current_city, :string
    add_column :trucks, :current_country, :string
  end
end
