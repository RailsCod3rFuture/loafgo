require 'rails_helper'

RSpec.describe "MyOrders", type: :request do
  describe "GET /my_orders" do
    it "works! (now write some real specs)" do
      get my_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
