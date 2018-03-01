class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.datetime :delivery_date
      t.boolean :delivery_on_time
      t.integer :order_magnitude_size
      t.string :truck_driver_name
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
