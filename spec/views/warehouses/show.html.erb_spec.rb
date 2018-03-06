require 'rails_helper'

RSpec.describe "warehouses/show", type: :view do
  before(:each) do
    @warehouse = assign(:warehouse, Warehouse.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
