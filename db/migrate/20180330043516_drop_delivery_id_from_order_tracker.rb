class DropDeliveryIdFromOrderTracker < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_trackers, :delivery_id
  end
end
