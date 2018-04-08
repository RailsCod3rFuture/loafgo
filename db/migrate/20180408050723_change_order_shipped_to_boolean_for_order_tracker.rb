class ChangeOrderShippedToBooleanForOrderTracker < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_trackers, :order_shipped
    add_column :order_trackers, :order_shipped, :boolean, default: false
  end
end
