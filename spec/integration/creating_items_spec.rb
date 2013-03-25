require 'spec_helper'

feature "Creating Items" do
  let!(:user) {Factory(:user)}

  before do
    sign_in_as!(user)
  end

  scenario "can create an item" do
    visit '/' #index action
    click_link "Add an Item" #new action
    fill_in 'Product ID', :with => 123
    fill_in 'Quantity', :with => 2
    click_button 'Create Item'
    page.should have_content('Item 123 has been added.')
  end

  scenario "cannot create an item with bad params" do
    visit '/'
    click_link "Add an Item"
    fill_in 'Product ID', :with => 123
    fill_in 'Quantity', :with =>2
    click_button 'Create Item'
    page.should_not
  end
end
