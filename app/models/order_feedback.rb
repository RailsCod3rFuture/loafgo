class OrderFeedback < ApplicationRecord
  belongs_to :delivery
  has_many :orders, through: :deliveries
end
