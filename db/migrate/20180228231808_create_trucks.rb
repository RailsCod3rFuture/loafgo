class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.datetime :loaded_date
      t.string :delivery_total
      t.string :lon
      t.string :lat
      t.references :warehouse, foreign_key: true
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end
