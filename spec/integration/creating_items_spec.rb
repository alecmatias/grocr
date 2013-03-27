require 'spec_helper'

feature "Creating Items" do
  let!(:user) {Factory(:user)}
  let!(:product) {Factory(:product)}

  before do
    sign_in_as!(user)
  end

  scenario "Can create an item" do
    visit '/' #index action
    click_link "Add an Item" #new action
    fill_in 'Product ID', :with => product.id
    fill_in 'Quantity', :with => 2
    click_button 'Create Item'
    page.should have_content("Item #{product.id} has been added.")
  end

  scenario "Cannot create an item with bad params" do
    visit '/'
    click_link "Add an Item"
    fill_in 'Product ID', :with => product.id
    fill_in 'Quantity', :with => -1
    click_button 'Create Item'
    page.should_not have_content("Item #{product.id} has been added.")
  end
end
