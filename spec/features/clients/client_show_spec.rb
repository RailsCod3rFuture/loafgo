include Warden::Test::Helpers
Warden.test_mode!

# Feature: client profile page
#   As a client
#   I want to visit my client profile page
#   So I can see my personal account data
feature 'client profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: client sees own profile
  #   Given I am signed in
  #   When I visit the client profile page
  #   Then I see my own email address
  scenario 'client sees own profile' do
    client = FactoryGirl.create(:client)
    login_as(client, :scope => :client)
    visit user_path(client)
    expect(page).to have_content 'client'
    expect(page).to have_content client.email
  end

  # Scenario: client cannot see another client's profile
  #   Given I am signed in
  #   When I visit another client's profile
  #   Then I see an 'access denied' message
  scenario "client cannot see another client's profile" do
    me = FactoryGirl.create(:client)
    other = FactoryGirl.create(:client, email: 'other@example.com')
    login_as(me, :scope => :client)
    Capybara.current_session.driver.header 'Referer', root_path
    visit client_path(other)
    expect(page).to have_content 'Access denied.'
  end

end