require 'spec_helper'

feature "Deleting products" do
  scenario "Deleting a product" do
    Factory(:product, :name => "Pepsi")
    visit "/products"
    click_link "Pepsi"
    click_link "Delete Product"
    page.should have_content("Product has been deleted.")
    visit "/products"
    page.should_not have_content("Pepsi")
  end
end
