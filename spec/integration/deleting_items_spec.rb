require 'spec_helper'

feature "Deleting items" do
  let!(:user) {Factory(:user)}

  before do
    sign_in_as!(user)
  end

  scenario "Removing an individual item" do
    p1 = Factory(:product)
    Factory(:item, :list => user.list, :product_id => p1.id, :quantity => 12)
    visit "/"
    click_link "#{p1.name}"
    click_link "Remove Item"
    page.should have_content("Item #{p1.id} has been removed.")
  end

  scenario "Deleting multiple items from your list using the index page" do
    p1 = Factory(:product)
    p2 = Factory(:product)
    p3 = Factory(:product)
    p4 = Factory(:product)

    Factory(:item, :list => user.list, :product => p1, :quantity => 1)
    Factory(:item, :list => user.list, :product => p2, :quantity => 2)
    Factory(:item, :list => user.list, :product => p3, :quantity => 2)
    Factory(:item, :list => user.list, :product => p4, :quantity => 1)

    visit "/"
    check("items[#{p1.id}]")
    check("items[#{p3.id}]")

    click_button("Remove Checked")
    page.should have_content("Items #{p1.id}, #{p3.id} have been removed.");
  end

  scenario "Removing multiple items from your list using the catalog" do
    p1 = Factory(:product)
    p2 = Factory(:product)
    p3 = Factory(:product)
    p4 = Factory(:product)

    Factory(:item, :list => user.list, :product => p1, :quantity => 1)
    Factory(:item, :list => user.list, :product => p2, :quantity => 2)
    Factory(:item, :list => user.list, :product => p3, :quantity => 2)
    Factory(:item, :list => user.list, :product => p4, :quantity => 1)

    visit "/"
    click_link "Add an Item"

    click_link "remove_product#{p3.id}"
    page.should have_content("Item #{p3.id} has been removed.");
  end
end
