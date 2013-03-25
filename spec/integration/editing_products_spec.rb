require 'spec_helper'

feature "Editing Products" do

  before do
    Factory(:product, :name => "SomeProduct")
    visit "/products"
    click_link "SomeProduct"
    click_link "Edit Product"
  end

  scenario "Updating a product" do
    fill_in "Name", :with => "SomeProduct"
    click_button "Update Product"
    page.should have_content("Product has been updated")
  end
end
