class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :bread_stock_quantity
      t.boolean :bread_inventory_low
      t.references :warehouse, foreign_key: true
      t.references :manager, foreign_key: true
      t.timestamps
    end
  end
end
