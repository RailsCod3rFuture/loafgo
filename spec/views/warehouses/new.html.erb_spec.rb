require 'rails_helper'

RSpec.describe "warehouses/new", type: :view do
  before(:each) do
    assign(:warehouse, Warehouse.new())
  end

  it "renders new warehouses form" do
    render

    assert_select "form[action=?][method=?]", warehouses_path, "post" do
    end
  end
end
