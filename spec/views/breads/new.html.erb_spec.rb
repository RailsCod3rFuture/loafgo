require 'rails_helper'

RSpec.describe "breads/new", type: :view do
  before(:each) do
    assign(:bread, Bread.new())
  end

  it "renders new bread form" do
    render

    assert_select "form[action=?][method=?]", breads_path, "post" do
    end
  end
end
