class UpdateForeignKeyOnOrder < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :orders, :clients
    add_foreign_key :orders, :clients, on_delete: :cascade
  end
end
