class Truck < ApplicationRecord
  belongs_to :warehouse
  belongs_to :delivery
end
