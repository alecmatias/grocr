require 'spec_helper'
feature 'Signing in' do
  before do
    Factory(:user, :email => "ticketee@example.com")
  end
  scenario 'Signing in' do
    visit '/'
    fill_in 'Email', :with => "ticketee@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in as ticketee@example.com")
  end
end
