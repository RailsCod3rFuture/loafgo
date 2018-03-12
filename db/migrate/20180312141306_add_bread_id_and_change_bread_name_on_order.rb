class AddBreadIdAndChangeBreadNameOnOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :bread_id, :bigint
    change_column :orders, :bread_name, :string
  end
end
