class Delivery < ApplicationRecord
  belongs_to :warehouse
  has_one :order
  has_one :order_tracker
  has_many :breads
  after_create :decrement_bread_stock

  def decrement_bread_stock
    bread.update_attribute("bread_quantity", (bread.bread_quantity - order_magnitude_size))
  end

end
