require 'rails_helper'

RSpec.describe "Breads", type: :request do
  describe "GET /breads" do
    it "works! (now write some real specs)" do
      get breads_path
      expect(response).to have_http_status(200)
    end
  end
end
