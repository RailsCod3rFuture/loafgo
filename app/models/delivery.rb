class Delivery < ApplicationRecord
  belongs_to :truck, optional: true
  belongs_to :warehouse
  has_one :delivery_order
  has_one :order_tracker
  has_many :breads
  # after_create :decrement_bread_stock
  accepts_nested_attributes_for :delivery_order


  def assigned_trucker_to_delivery
    "Delivery for #{delivery_order.order.client_name} w/ID ##{id} was assigned to #{truck.truck_driver_name} on #{delivery_date.strftime('%D')}"
  end

end
