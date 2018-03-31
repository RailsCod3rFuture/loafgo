class FixForeignKeyForTrucks < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :trucks, :deliveries
    add_foreign_key :trucks, :deliveries, on_delete: :cascade
  end
end
