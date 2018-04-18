class Order < ApplicationRecord
  belongs_to :client, optional: true
  has_one :delivery_order
  has_many :breads
  has_one :order_tracker, dependent: :destroy
  has_one :order_feedback
  accepts_nested_attributes_for :order_tracker
  accepts_nested_attributes_for :order_feedback
  geocoded_by :address, latitude: :lat, longitude: :lon
  after_validation :geocode, if: ->(obj) {obj.client_address.present? && obj.client_address_changed?}

  def address
    [client_address, client_state].compact.join(', ')
  end

  after_create do
    create_order_tracker(
        order_date: created_at,
        delivery_on_time: true,
        order_shipped: false,
        order_location: 'TBA',
        time_delivered: 'TBA',

        )
  end

  after_create do
    create_order_feedback(
        title: 'Untitled',
        order_opinion: 'Positive',
        feedback_body_text: 'Add your comments & feedback about the order, here!',
    )
  end
end
