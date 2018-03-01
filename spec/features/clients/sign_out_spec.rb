# Feature: Sign out
#   As a client
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do

  # Scenario: client signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'client signs out successfully' do
    client = FactoryGirl.create(:client)
    signin(client.email, client.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
    click_link 'Sign out'
    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end

end
