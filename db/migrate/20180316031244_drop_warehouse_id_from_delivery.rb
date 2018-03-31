class DropWarehouseIdFromDelivery < ActiveRecord::Migration[5.1]
  def change
    remove_column :deliveries, :warehouse_id
  end
end
