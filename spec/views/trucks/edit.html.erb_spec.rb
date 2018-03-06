require 'rails_helper'

RSpec.describe "trucks/edit", type: :view do
  before(:each) do
    @truck = assign(:truck, Truck.create!())
  end

  it "renders the edit truck form" do
    render

    assert_select "form[action=?][method=?]", truck_path(@truck), "post" do
    end
  end
end
