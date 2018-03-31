class UpdateForeignKeyForDelivery < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :deliveries, :trucks
    add_foreign_key :deliveries, :trucks, on_delete: :cascade
  end
end
