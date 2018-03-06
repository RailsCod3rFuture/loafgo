require 'rails_helper'

RSpec.describe "breads/index", type: :view do
  before(:each) do
    assign(:breads, [
        Bread.create!(),
        Bread.create!()
    ])
  end

  it "renders a list of breads" do
    render
  end
end
