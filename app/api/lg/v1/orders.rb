module LG
  module V1
    module Entities
      class Order < Grape::Entity
        format_with(:iso_timestamp, &:iso8601)

        expose :client_name
        expose :client_zip_code
        expose :client_state
        expose :lon
        expose :lat
        expose :client_address
        expose :bread_name
        expose :bread_quantity
        expose :order_tracker do
          expose :order_date
          expose :time_delivered
          expose :delivery_on_time
          expose :order_shipped
          expose :order_location
        end

        with_options(format_with: :iso_timestamp) do
          expose :created_at
          expose :updated_at
        end
      end
    end

    class Orders < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :orders do
        desc 'Return all orders'
        get do
          orders = Order.all
          present orders
        end

        params do
          requires :id, type: Integer, desc: 'Order id.'
        end

        desc 'Return a specific order'
        route_param :id do
          get do
            order = Order.find(params[:id])
            present order
          end
        end

        desc 'Create a Order'
        params do
          requires :client_n, type: String, desc: 'Client name'
          requires :client_z, type: String, desc: 'Client Zip code'
          requires :client_s, type: String, desc: 'Client State'
          requires :client_lon, type: String, desc: 'Client Longitude'
          requires :client_lat, type: String, desc: 'Client Latitude'
          requires :client_add, type: String, desc: 'Client Address'
          requires :bread_n, type: String, desc: 'Bread Name'
          requires :bread_q, type: Integer, desc: 'Bread Quantity'
          requires :b_id, type: Integer, desc: 'Bread ID'
        end

        post do
          Order.create!(
            client_name: params[:client_n],
            client_zip_code: params[:client_z],
            client_state: params[:client_s],
            lon: params[:client_lon],
            lat: params[:client_lat],
            client_address: params[:client_add],
            bread_name: params[:bread_n],
            bread_quantity: params[:bread_q],
            client_id: current_client.id,
            bread_id: params[:b_id]
          )
        end

        desc 'Update a order.'
        params do
          requires :id, type: Integer, desc: 'Order ID'
          requires :client_id, type: Integer, desc: 'Client ID'
        end

        put ':id' do
          current_client.orders.find(params[:id]).update(
            client_id: current_client,
            client_zip_code: params[:client_z],
            client_name: params[:client_n],
            client_state: params[:client_s],
            lon: params[:client_lon],
            lat: params[:client_lat],
            client_address: params[:client_add],
            bread_name: params[:bread_n],
            bread_quantity: params[:bread_q],
            bread_id: params[:b_id]
          )
        end

        desc 'Delete a order'
        params do
          requires :id, type: Integer, desc: 'Order ID'
        end
        delete ':id' do
          current_client.orders.find(params[:id]).destroy
        end
      end
    end
  end
end
