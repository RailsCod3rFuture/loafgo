class Truck < ApplicationRecord
  belongs_to :warehouse, optional: true
  has_many :deliveries
  geocoded_by :truck_location, :latitude => :lat, :longitude => :lon

  def truck_location
    [current_street_address, current_state, current_country]
  end
end
