# Feature: Sign in
#   As a client
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do

  # Scenario: client cannot sign in if not registered
  #   Given I do not exist as a client
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  scenario 'client cannot sign in if not registered' do
    signin('test@example.com', 'please123')
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'Email'
  end

  # Scenario: client can sign in with valid credentials
  #   Given I exist as a client
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  scenario 'client can sign in with valid credentials' do
    client = FactoryGirl.create(:client)
    signin(client.email, client.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  # Scenario: client cannot sign in with wrong email
  #   Given I exist as a client
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  scenario 'client cannot sign in with wrong email' do
    client = FactoryGirl.create(:client)
    signin('invalid@email.com', client.password)
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'Email'
  end

  # Scenario: client cannot sign in with wrong password
  #   Given I exist as a client
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  scenario 'client cannot sign in with wrong password' do
    client = FactoryGirl.create(:client)
    signin(client.email, 'invalidpass')
    expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'Email'
  end

end