require 'rails_helper'

RSpec.describe "my_orders/index", type: :view do
  before(:each) do
    assign(:my_orders, [
        MyOrder.create!(),
        MyOrder.create!()
    ])
  end

  it "renders a list of my_orders" do
    render
  end
end
