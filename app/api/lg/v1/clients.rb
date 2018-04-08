module LG
  module V1
    module Entities
      class Client < Grape::Entity
        format_with(:iso_timestamp, &:iso8601)
      end
    end

    class Clients < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :clients do
        desc 'Return all clients'
        get do
          clients = Client.all
          present clients
        end
      end
    end
  end
end
