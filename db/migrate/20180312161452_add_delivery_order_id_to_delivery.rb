class AddDeliveryOrderIdToDelivery < ActiveRecord::Migration[5.1]
  def change
    add_reference :deliveries, :delivery_order, foreign_key: true
  end
end
