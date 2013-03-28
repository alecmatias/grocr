require 'spec_helper'

feature "Deleting products" do

  before do
    sign_in_as!(Factory(:admin_user))
  end

  scenario "Deleting a product" do
    Factory(:product, :name => "Pepsi")
    visit "/products"
    click_link "Pepsi"
    click_link "Delete"
    page.should have_content("'Pepsi' has been deleted.")
    visit "/products"
    page.should_not have_content("Pepsi")
  end
end
