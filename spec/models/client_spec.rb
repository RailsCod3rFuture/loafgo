require 'rails_helper'

RSpec.describe Client, type: :model do

  before(:each) {@client = Client.new(email: 'client@example.com')}

  subject {@client}

  it {should respond_to(:email)}

  it "#email returns a string" do
    expect(@client.email).to match 'client@example.com'
  end

end
