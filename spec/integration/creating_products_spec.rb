require 'spec_helper'

feature 'Creating Products'  do

  before do
    sign_in_as!(Factory(:admin_user))
  end

  scenario "Can create a product" do
    visit '/'
    click_link 'Add a new product'
    fill_in 'Name', :with => 'Peanut Butter Creamy'
    fill_in 'Manufacturer', :with => 'Skippy'
    fill_in 'Price', :with => '5.89'
    fill_in 'Size', :with => '28 oz'
    fill_in 'Description', :with => 'Yummy tasty peanut butter'
    attach_file "Image", "spec/fixtures/peanut_butter.jpg"
    click_button 'Create Product'
    page.should have_content('Product has been created')
#    within ("#product .image") do
      page.should have_content("peanut_butter.jpg")
#    end
  end
end
