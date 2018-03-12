class AddInventoryIdToBread < ActiveRecord::Migration[5.1]
  def change
    add_reference :breads, :inventory, foreign_key: true
  end
end
