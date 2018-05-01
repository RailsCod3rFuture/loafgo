class RemoveInventoryIdFromBread < ActiveRecord::Migration[5.1]
  def change
    remove_column :breads, :inventory_id
  end
end
