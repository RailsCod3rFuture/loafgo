require "rails_helper"

RSpec.describe MyOrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/my_orders").to route_to("my_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/my_orders/new").to route_to("my_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/my_orders/1").to route_to("my_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/my_orders/1/edit").to route_to("my_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/my_orders").to route_to("my_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/my_orders/1").to route_to("my_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/my_orders/1").to route_to("my_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/my_orders/1").to route_to("my_orders#destroy", :id => "1")
    end

  end
end
