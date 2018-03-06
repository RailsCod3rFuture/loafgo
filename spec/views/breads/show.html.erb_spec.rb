require 'rails_helper'

RSpec.describe "breads/show", type: :view do
  before(:each) do
    @bread = assign(:bread, Bread.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
