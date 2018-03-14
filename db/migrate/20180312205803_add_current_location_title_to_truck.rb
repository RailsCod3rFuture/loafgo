class AddCurrentLocationTitleToTruck < ActiveRecord::Migration[5.1]
  def change
    add_column :trucks, :current_location_title, :string
  end
end
