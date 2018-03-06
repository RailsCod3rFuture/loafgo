require 'rails_helper'

RSpec.describe "OrderFeedbacks", type: :request do
  describe "GET /order_feedbacks" do
    it "works! (now write some real specs)" do
      get order_feedbacks_path
      expect(response).to have_http_status(200)
    end
  end
end
