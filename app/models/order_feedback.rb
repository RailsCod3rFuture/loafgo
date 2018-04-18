class OrderFeedback < ApplicationRecord
  belongs_to :order, optional: true, dependent: :destroy
end
