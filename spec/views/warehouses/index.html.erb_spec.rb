require 'rails_helper'

RSpec.describe "warehouses/index", type: :view do
  before(:each) do
    assign(:warehouses, [
        Warehouse.create!(),
        Warehouse.create!()
    ])
  end

  it "renders a list of warehouses" do
    render
  end
end
