class OrderFeedback < ApplicationRecord
  belongs_to :delivery, optional: true
  has_many :orders, through: :deliveries
end
