require 'spec_helper'

feature "Viewing Items" do
  let!(:user) {Factory(:user)}
  let!(:user2) {Factory(:user)}

  scenario "can only view your own items" do
    sign_in_as!(user)
    visit '/'
    click_link "Add an Item" #new action
    fill_in 'Product ID', :with => 123
    fill_in 'Quantity', :with => 2
    click_button 'Create Item'
    page.should have_content('Item 123 has been added.')

    click_link "Sign out"
    sign_in_as!(user2)
    visit '/'
    page.should_not have_content('123')
    page.should_not have_css('#items[123]')
  end

  scenario "signed out users can't view items" do
    page.should_not have_content("Items")
  end
end
