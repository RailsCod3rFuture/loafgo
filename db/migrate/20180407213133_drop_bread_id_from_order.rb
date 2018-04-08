class DropBreadIdFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :bread_id
  end
end
