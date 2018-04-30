class DropWarehouseIdFromInventory < ActiveRecord::Migration[5.1]
  def change
    remove_column :inventories, :warehouse_id
    remove_column :inventories, :manager_id
    add_index :inventories, :bread_id
  end
end
