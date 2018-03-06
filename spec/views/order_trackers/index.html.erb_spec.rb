require 'rails_helper'

RSpec.describe "order_trackers/index", type: :view do
  before(:each) do
    assign(:order_trackers, [
        OrderTracker.create!(),
        OrderTracker.create!()
    ])
  end

  it "renders a list of order_trackers" do
    render
  end
end
