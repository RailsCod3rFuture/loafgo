require 'rails_helper'

RSpec.describe "order_feedbacks/show", type: :view do
  before(:each) do
    @order_feedback = assign(:order_feedback, OrderFeedback.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
