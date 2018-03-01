class Truck < ApplicationRecord
  belongs_to :warehouse
  has_many :deliveries
end
