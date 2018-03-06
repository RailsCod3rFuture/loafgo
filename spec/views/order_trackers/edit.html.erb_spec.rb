require 'rails_helper'

RSpec.describe "order_trackers/edit", type: :view do
  before(:each) do
    @order_tracker = assign(:order_tracker, OrderTracker.create!())
  end

  it "renders the edit order_tracker form" do
    render

    assert_select "form[action=?][method=?]", order_tracker_path(@order_tracker), "post" do
    end
  end
end
