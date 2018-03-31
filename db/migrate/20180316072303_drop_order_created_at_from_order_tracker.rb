class DropOrderCreatedAtFromOrderTracker < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_trackers, :order_created_at
  end
end
