require 'rails_helper'

RSpec.describe "my_orders/new", type: :view do
  before(:each) do
    assign(:my_order, MyOrder.new())
  end

  it "renders new my_order form" do
    render

    assert_select "form[action=?][method=?]", my_orders_path, "post" do
    end
  end
end
