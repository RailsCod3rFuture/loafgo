class DropDeliveryMenCountFromWarehouse < ActiveRecord::Migration[5.1]
  def change
    remove_column :warehouses, :delivery_men_count
  end
end
