class DropDeliveryIdFromOrderFeedback < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_feedbacks, :delivery_id
  end
end
