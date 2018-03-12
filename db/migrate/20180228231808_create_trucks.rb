class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.datetime :loaded_date
      t.string :truck_driver_name
      t.string :delivery_total
      t.string :lon
      t.string :lat
      t.string :current_street_address
      t.string :current_state
      t.string :current_city
      t.string :current_country
      t.references :warehouse, index: true, foreign_key: true
      t.references :delivery, index: true, foreign_key: true

      t.timestamps
    end
  end
end
