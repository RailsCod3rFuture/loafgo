class AddBreadIdToInventory < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :bread_id, :integer, limit: 8, index: true
  end
end
