class DropBreadTypeFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :bread_type
  end
end
