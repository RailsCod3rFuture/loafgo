class Delivery < ApplicationRecord
  belongs_to :warehouse, optional: true
  belongs_to :truck, optional: true
  has_one :delivery_order
  has_one :order_tracker
  has_many :breads
  #after_create :decrement_bread_stock
  accepts_nested_attributes_for :delivery_order

end