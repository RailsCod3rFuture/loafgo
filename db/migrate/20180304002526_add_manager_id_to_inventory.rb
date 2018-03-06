class AddManagerIdToInventory < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventories, :manager, foreign_key: true
  end
end
