require "rails_helper"

RSpec.describe BreadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/breads").to route_to("breads#index")
    end

    it "routes to #new" do
      expect(:get => "/breads/new").to route_to("breads#new")
    end

    it "routes to #show" do
      expect(:get => "/breads/1").to route_to("breads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/breads/1/edit").to route_to("breads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/breads").to route_to("breads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/breads/1").to route_to("breads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/breads/1").to route_to("breads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/breads/1").to route_to("breads#destroy", :id => "1")
    end

  end
end
