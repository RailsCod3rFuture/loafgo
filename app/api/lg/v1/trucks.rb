module LG
  module V1
    module Entities
      class Truck < Grape::Entity
        format_with(:iso_timestamp, &:iso8601)
        expose :loaded_date
        expose :delivery_total
        expose :lon
        expose :lat
        expose :current_street_address
        expose :current_city
        expose :current_state
        expose :current_country
        expose :truck_driver_name
        expose :current_location_title

        with_options(format_with: :iso_timestamp) do
          expose :created_at
          expose :updated_at
        end
      end
    end

    class Trucks < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :trucks do
        desc 'Return all trucks'
        get do
          trucks = Truck.all
          present trucks
        end
      end
    end
  end
end
