require "rails_helper"

RSpec.describe OrderTrackersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_trackers").to route_to("order_trackers#index")
    end

    it "routes to #new" do
      expect(:get => "/order_trackers/new").to route_to("order_trackers#new")
    end

    it "routes to #show" do
      expect(:get => "/order_trackers/1").to route_to("order_trackers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/order_trackers/1/edit").to route_to("order_trackers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/order_trackers").to route_to("order_trackers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/order_trackers/1").to route_to("order_trackers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/order_trackers/1").to route_to("order_trackers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_trackers/1").to route_to("order_trackers#destroy", :id => "1")
    end

  end
end
