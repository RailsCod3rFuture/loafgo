class UpdateForeignKeyForDeliveryOrders < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :delivery_orders, :deliveries
    add_foreign_key :delivery_orders, :deliveries, on_delete: :cascade
  end
end
