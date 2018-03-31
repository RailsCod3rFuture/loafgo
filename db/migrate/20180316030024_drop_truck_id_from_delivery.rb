class DropTruckIdFromDelivery < ActiveRecord::Migration[5.1]
  def change
    remove_column :deliveries, :truck_id
  end
end
