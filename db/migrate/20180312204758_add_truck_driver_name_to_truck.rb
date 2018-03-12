class AddTruckDriverNameToTruck < ActiveRecord::Migration[5.1]
  def change
    add_column :trucks, :truck_driver_name, :string
  end
end
