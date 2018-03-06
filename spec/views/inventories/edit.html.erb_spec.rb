require 'rails_helper'

RSpec.describe "inventories/edit", type: :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!())
  end

  it "renders the edit inventory form" do
    render

    assert_select "form[action=?][method=?]", inventory_path(@inventory), "post" do
    end
  end
end
