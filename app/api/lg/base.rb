module LG
  class Base < Grape::API
    acts_as_token_authentication_handler_for Client, fallback: :none
    mount LG::V1::Orders
    format :json

    rescue_from ActiveRecord::RecordNotFound do |e|
      Rack::Response.new({
                             error_code: 404,
                             error_message: e.message
                         }.to_json, 404).finish
    end

    rescue_from :all do |e|
      Rack::Response.new({
                             error_code: 500,
                             error_message: e.message
                         }.to_json, 500).finish
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @client = Client.find_by_authentication_token(params[:access_token])
      end

      def current_client
        warden.client || @client
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_client
      end
    end
  end
end
