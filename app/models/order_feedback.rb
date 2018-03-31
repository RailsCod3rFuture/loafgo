class OrderFeedback < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :client, optional: true
end
