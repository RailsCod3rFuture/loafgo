require 'rails_helper'

RSpec.describe "breads/edit", type: :view do
  before(:each) do
    @bread = assign(:bread, Bread.create!())
  end

  it "renders the edit bread form" do
    render

    assert_select "form[action=?][method=?]", bread_path(@bread), "post" do
    end
  end
end
