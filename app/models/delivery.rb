class Delivery < ApplicationRecord
  belongs_to :warehouse
  has_many :orders
  has_many :order_trackers
end
