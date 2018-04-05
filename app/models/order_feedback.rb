class OrderFeedback < ApplicationRecord
  belongs_to :order, optional: true, dependent: :destroy
  belongs_to :client, optional: true
end
