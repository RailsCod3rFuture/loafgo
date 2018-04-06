GrapeDeviseTokenAuth.setup! do |config|
  config.authenticate_all = false
end

module GrapeApi
  class Orders < Grape::API
    auth :grape_devise_token_auth, resource_class: :client

    format :json
    prefix :api
    helpers GrapeDeviseTokenAuth::AuthHelpers

    helpers do
      def authenticate_client!
        error!('401 Unauthorized', 401) unless current_client
      end

      def current_client
        client = Client.where(tokens: params[:tokens]).first
        if client
          @current_client = client
        else
          false
        end
      end
    end

    resources :orders do
      desc 'Return Orders.'
      get :orders do
        authenticate_client!
        current_client.orders.limit(20)
      end

      desc 'Return Order Trackers'
      get :order_trackers do
        authenticate_client!
        current_client.order.order_trackers
      end

      desc 'Return a Order'
      params do
        requires :id, type: Integer, desc: 'Order id.'
      end

      route_param :id do
        get do
          current_client.orders.find(params[:id])
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
        authenticate_client!
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
        authenticate_client!
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
        authenticate_client!
        current_client.orders.find(params[:id]).destroy
      end
    end
  end
end
