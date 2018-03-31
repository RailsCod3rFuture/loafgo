class Truck < ApplicationRecord
  belongs_to :warehouse, optional: true
  has_one :delivery
  has_paper_trail on: [:update, :destroy]
  geocoded_by :truck_location, :latitude => :lat, :longitude => :lon
  after_validation :geocode, if: -> (obj) {obj.current_street_address.present? && obj.current_street_address_changed?}
  def truck_location
    [current_street_address, current_state, current_country].compact.join(', ')
  end
end
