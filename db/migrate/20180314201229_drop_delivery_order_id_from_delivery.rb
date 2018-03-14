class DropDeliveryOrderIdFromDelivery < ActiveRecord::Migration[5.1]
  def change
    remove_column :deliveries, :delivery_order_id
  end
end
