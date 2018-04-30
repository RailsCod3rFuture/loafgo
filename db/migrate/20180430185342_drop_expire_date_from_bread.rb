class DropExpireDateFromBread < ActiveRecord::Migration[5.1]
  def change
    remove_column :breads, :bread_expire_date
  end
end
