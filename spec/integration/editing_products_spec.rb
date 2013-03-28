require 'spec_helper'

feature "Editing Products" do

  before do
    sign_in_as!(Factory(:admin_user))
    Factory(:product, :name => "SomeProduct")
    visit "/products"
    click_link "SomeProduct"
    click_link "Edit"
  end

  scenario "Updating a product" do
    fill_in "Name", :with => "SomeProduct"
    click_button "Update Product"
    page.should have_content("'SomeProduct' has been updated")
  end
end
