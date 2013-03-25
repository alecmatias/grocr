require 'spec_helper'

feature 'Creating Products'  do
  scenario "Can create a product" do
    visit '/'
    click_link 'Add a new product'
    fill_in 'Name', :with => 'Peanut Butter Creamy'
    fill_in 'Manufacturer', :with => 'Skippy'
    fill_in 'Price', :with => '5.89'
    fill_in 'Size', :with => '28 oz'
    click_button 'Create Product'
    page.should have_content('Product has been created')
  end
end
