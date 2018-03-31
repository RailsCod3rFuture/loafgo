class AddShippingInfoToOrderTracker < ActiveRecord::Migration[5.1]
  def change
    add_column :order_trackers, :order_shipped, :string
    add_column :order_trackers, :order_location, :string
  end
end
