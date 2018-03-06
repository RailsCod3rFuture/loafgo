require 'rails_helper'

RSpec.describe "warehouses/edit", type: :view do
  before(:each) do
    @warehouse = assign(:warehouse, Warehouse.create!())
  end

  it "renders the edit warehouses form" do
    render

    assert_select "form[action=?][method=?]", warehouse_path(@warehouse), "post" do
    end
  end
end
