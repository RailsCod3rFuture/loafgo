include Warden::Test::Helpers
Warden.test_mode!

# Feature: client edit
#   As a client
#   I want to edit my client profile
#   So I can change my email address
feature 'client edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: client changes email address
  #   Given I am signed in
  #   When I change my email address
  #   Then I see an account updated message
  scenario 'client changes email address' do
    client = FactoryGirl.create(:client)
    login_as(client, :scope => :client)
    visit edit_user_registration_path(client)
    fill_in 'Email', :with => 'newemail@example.com'
    fill_in 'Current password', :with => client.password
    click_button 'Update'
    txts = [I18n.t('devise.registrations.updated'), I18n.t('devise.registrations.update_needs_confirmation')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  # Scenario: client cannot edit another client's profile
  #   Given I am signed in
  #   When I try to edit another client's profile
  #   Then I see my own 'edit profile' page
  scenario "client cannot cannot edit another client's profile", :me do
    me = FactoryGirl.create(:client)
    other = FactoryGirl.create(:client, email: 'other@example.com')
    login_as(me, :scope => :client)
    visit edit_user_registration_path(other)
    expect(page).to have_content 'Edit client'
    expect(page).to have_field('Email', with: me.email)
  end

end