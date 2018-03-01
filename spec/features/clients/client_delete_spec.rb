include Warden::Test::Helpers
Warden.test_mode!

# Feature: client delete
#   As a client
#   I want to delete my client profile
#   So I can close my account
feature 'client delete', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: client can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'client can delete own account' do
    skip 'skip a slow test'
    client = FactoryGirl.create(:client)
    login_as(client, :scope => :client)
    visit edit_client_registration_path(client)
    click_button 'Cancel my account'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content I18n.t 'devise.registrations.destroyed'
  end

end