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
    click_link "add_product#{product.id}"
    page.should have_content("Item #{product.id} has been added to your list.")
  end
end
