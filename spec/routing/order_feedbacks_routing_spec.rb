require "rails_helper"

RSpec.describe OrderFeedbacksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_feedbacks").to route_to("order_feedbacks#index")
    end

    it "routes to #new" do
      expect(:get => "/order_feedbacks/new").to route_to("order_feedbacks#new")
    end

    it "routes to #show" do
      expect(:get => "/order_feedbacks/1").to route_to("order_feedbacks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/order_feedbacks/1/edit").to route_to("order_feedbacks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/order_feedbacks").to route_to("order_feedbacks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/order_feedbacks/1").to route_to("order_feedbacks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/order_feedbacks/1").to route_to("order_feedbacks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_feedbacks/1").to route_to("order_feedbacks#destroy", :id => "1")
    end

  end
end
