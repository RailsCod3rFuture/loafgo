class AddOrderIdToOrderFeedback < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_feedbacks, :order, foreign_key: true
  end
end
