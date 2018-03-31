class OrderTracker < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :manager, optional: true
end
