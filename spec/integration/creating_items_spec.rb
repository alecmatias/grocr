require 'spec_helper'

feature "Creating Items" do
  scenario "can create an item" do
    visit '/' #index action
    click_link "Add an Item" #new action
    fill_in 'Product ID', :with => 123
    fill_in 'Quantity', :with => 2
    click_button 'Create Item'
    page.should have_content('Item 123 has been added.')
  end
end
