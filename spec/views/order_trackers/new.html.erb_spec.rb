require 'rails_helper'

RSpec.describe "order_trackers/new", type: :view do
  before(:each) do
    assign(:order_tracker, OrderTracker.new())
  end

  it "renders new order_tracker form" do
    render

    assert_select "form[action=?][method=?]", order_trackers_path, "post" do
    end
  end
end
