class AddWarehouseIdToInventory < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventories, :warehouse, foreign_key: true
    remove_column :inventories, :manager_id
  end
end
