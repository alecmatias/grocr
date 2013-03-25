require 'spec_helper'

feature "Viewing products" do
  scenario "Listing all products" do
    product = Factory.create(:product, :name => "Cocca Cola")
    visit '/products'
    click_link 'Cocca Cola'
    page.current_url.should ==  product_url(product)
  end
end
