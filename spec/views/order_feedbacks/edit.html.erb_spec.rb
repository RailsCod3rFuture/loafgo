require 'rails_helper'

RSpec.describe "order_feedbacks/edit", type: :view do
  before(:each) do
    @order_feedback = assign(:order_feedback, OrderFeedback.create!())
  end

  it "renders the edit order_feedback form" do
    render

    assert_select "form[action=?][method=?]", order_feedback_path(@order_feedback), "post" do
    end
  end
end
