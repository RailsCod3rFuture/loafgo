class AddUpcAndImgUrlToBread < ActiveRecord::Migration[5.1]
  def change
    add_column :breads, :upc, :string
    add_column :breads, :image_url, :string
  end
end
