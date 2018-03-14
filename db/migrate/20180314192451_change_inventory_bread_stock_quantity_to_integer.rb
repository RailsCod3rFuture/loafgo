class ChangeInventoryBreadStockQuantityToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :inventories, :bread_stock_quantity, 'integer USING CAST(bread_stock_quantity AS integer)'
  end
end
