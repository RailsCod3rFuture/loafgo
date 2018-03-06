class AddBreadQuantityToBread < ActiveRecord::Migration[5.1]
  def change
    add_column :breads, :bread_quantity, :integer
  end
end
