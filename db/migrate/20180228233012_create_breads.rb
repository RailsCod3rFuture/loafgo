class CreateBreads < ActiveRecord::Migration[5.1]
  def change
    create_table :breads do |t|
      t.string :bread_name
      t.string :bread_type
      t.date :bread_expire_date
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
