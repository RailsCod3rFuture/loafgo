class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :address
      t.string :zip_code
      t.integer :delivery_men_count
      t.string :state
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
