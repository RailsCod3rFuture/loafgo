class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :address
      t.string :zip_code
      t.string :state
      t.references :manager, index: true, foreign_key: true
      t.references :truck, index: true, foreign_key: true
      t.references :inventory, index: true, foreign_key: true
      t.timestamps
    end
  end
end
