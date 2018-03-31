class AddWarehouseForeignKeyToDelivery < ActiveRecord::Migration[5.1]
  def change
    add_reference :deliveries, :warehouse, foreign_key: true
  end
end
