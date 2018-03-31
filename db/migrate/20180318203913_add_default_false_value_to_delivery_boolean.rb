class AddDefaultFalseValueToDeliveryBoolean < ActiveRecord::Migration[5.1]

  def up
    change_column :deliveries, :delivery_on_time, :boolean, default: true
  end

  def down
    change_column :deliveries, :delivery_on_time, :boolean, default: nil
  end
end
