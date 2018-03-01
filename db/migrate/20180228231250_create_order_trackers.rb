class CreateOrderTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :order_trackers do |t|
      t.datetime :order_date
      t.string :order_created_at
      t.string :time_delivered
      t.boolean :delivery_on_time
      t.references :order, foreign_key: true
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end
