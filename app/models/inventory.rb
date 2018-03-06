class Inventory < ApplicationRecord
  belongs_to :warehouse
  belongs_to :manager
  has_many :breads

  after_create :decrement_bread_quantity

  def decrement_bread_quantity
    self.bread_stock_quantity = inventory.bread.bread_quantity
    save
  end
end
