require 'spec_helper'

feature "Viewing Items" do
  let!(:user) {Factory(:user)}
  let!(:user2) {Factory(:user)}
  let!(:product) {Factory(:product)}

  scenario "can only view your own items" do
    sign_in_as!(user)
    visit '/'
    click_link "Add an Item" #new action
    click_link "add_product#{product.id}"
    #click_button 'Create Item'
    page.should have_content("Item #{product.id} has been added to your list.")

    click_link "Sign out"
    sign_in_as!(user2)
    visit '/'
    page.should_not have_css("#items[#{product.id}]")
  end

  scenario "signed out users can't view items" do
    page.should_not have_content("Items")
  end
end
