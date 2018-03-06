class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :client_name
      t.string :client_zip_code
      t.string :client_state
      t.string :lon
      t.string :lat
      t.string :client_address
      t.string :bread_name
      t.string :bread_type
      t.integer :bread_quantity
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
