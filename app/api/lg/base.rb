module LG
  class Base < Grape::API
    acts_as_token_authentication_handler_for Client, fallback: :none
    include Grape::Kaminari
    mount LG::V1::Orders

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
      def current_client
        client = Client.where(authentication_token: params[:auth_token]).first
        if user
          @current_client = client
        else
          false
        end
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_client
      end
    end
  end
end