class AddTruckIdToDelivery < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :truck_id, :bigint
  end
end
