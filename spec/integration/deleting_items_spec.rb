require 'spec_helper'

feature "Deleting items" do
  let!(:user) {Factory(:user)}

  before do
    sign_in_as!(user)
  end

  scenario "Removing an individual item" do
    Factory(:item, :list => user.list, :product_id => 101, :quantity => 12)
    visit "/"
    click_link "101"
    click_link "Remove Item"
    page.should have_content("Item has been removed.")
  end

  scenario "Deleting multiple items from a list" do
    Factory(:item, :list => user.list, :product_id => 111, :quantity => 1)
    Factory(:item, :list => user.list, :product_id => 112, :quantity => 2)
    Factory(:item, :list => user.list, :product_id => 113, :quantity => 2)
    Factory(:item, :list => user.list, :product_id => 114, :quantity => 1)

    visit "/"
    save_and_open_page
    check('items[111]')
    check('items[113]')

    click_button("Remove Checked")
    page.should have_content("Items 111, 113 have been removed.");
  end
end
