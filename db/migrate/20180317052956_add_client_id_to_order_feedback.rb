class AddClientIdToOrderFeedback < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_feedbacks, :client, foreign_key: true
  end
end
