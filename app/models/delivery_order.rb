class DeliveryOrder < ApplicationRecord
  belongs_to :order, inverse_of: :delivery_order
  belongs_to :delivery, optional: true
end
