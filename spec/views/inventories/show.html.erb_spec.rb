require 'rails_helper'

RSpec.describe "inventories/show", type: :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
