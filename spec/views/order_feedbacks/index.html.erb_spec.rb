require 'rails_helper'

RSpec.describe "order_feedbacks/index", type: :view do
  before(:each) do
    assign(:order_feedbacks, [
        OrderFeedback.create!(),
        OrderFeedback.create!()
    ])
  end

  it "renders a list of order_feedbacks" do
    render
  end
end
