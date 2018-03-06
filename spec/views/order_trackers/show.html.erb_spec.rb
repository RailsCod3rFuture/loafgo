require 'rails_helper'

RSpec.describe "order_trackers/show", type: :view do
  before(:each) do
    @order_tracker = assign(:order_tracker, OrderTracker.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
