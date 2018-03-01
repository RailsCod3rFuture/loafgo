include Warden::Test::Helpers
Warden.test_mode!

# Feature: client index page
#   As a client
#   I want to see a list of users
#   So I can see who has registered
feature 'client dashboard index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: client listed on index page
  #   Given I am signed in
  #   When I visit the client index page
  #   Then I see my own email address
  scenario 'client sees own email address' do
    client = FactoryGirl.create(:client)
    login_as(client, scope: :client)
    visit client_dashboard_index_path
    expect(page).to have_content client.email
  end

end