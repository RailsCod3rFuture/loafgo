class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.datetime :delivery_date
      t.boolean :delivery_on_time
      t.string :delivery_note
      t.references :warehouse, index: true, foreign_key: true
      t.references :delivery_orders, index: true, foreign_key: true
      t.references :truck, index: true, foreign_key: true
      t.timestamps
    end
  end
end
