class CreateOrderFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :order_feedbacks do |t|
      t.string :title
      t.string :order_opinion
      t.text :feedback_body_text
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end
