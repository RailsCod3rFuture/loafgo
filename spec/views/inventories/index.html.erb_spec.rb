require 'rails_helper'

RSpec.describe "inventories/index", type: :view do
  before(:each) do
    assign(:inventories, [
        Inventory.create!(),
        Inventory.create!()
    ])
  end

  it "renders a list of inventories" do
    render
  end
end
