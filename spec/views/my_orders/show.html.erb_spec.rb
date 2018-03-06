require 'rails_helper'

RSpec.describe "my_orders/show", type: :view do
  before(:each) do
    @my_order = assign(:my_order, MyOrder.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
