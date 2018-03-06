require 'rails_helper'

RSpec.describe "trucks/show", type: :view do
  before(:each) do
    @truck = assign(:truck, Truck.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
