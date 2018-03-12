class Truck < ApplicationRecord
  belongs_to :warehouse, optional: true
  has_many :deliveries
end
