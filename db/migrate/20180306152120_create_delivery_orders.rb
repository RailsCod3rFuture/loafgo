class CreateDeliveryOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_orders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :delivery, index: true, foreign_key: true

      t.timestamps
    end
  end
end
