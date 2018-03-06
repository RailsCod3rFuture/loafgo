require 'rails_helper'

RSpec.describe "inventories/new", type: :view do
  before(:each) do
    assign(:inventory, Inventory.new())
  end

  it "renders new inventory form" do
    render

    assert_select "form[action=?][method=?]", inventories_path, "post" do
    end
  end
end
