require 'rails_helper'

RSpec.describe "order_feedbacks/new", type: :view do
  before(:each) do
    assign(:order_feedback, OrderFeedback.new())
  end

  it "renders new order_feedback form" do
    render

    assert_select "form[action=?][method=?]", order_feedbacks_path, "post" do
    end
  end
end
