class Bread < ApplicationRecord
  has_many :orders
  has_many :deliveries
  belongs_to :warehouse
end
