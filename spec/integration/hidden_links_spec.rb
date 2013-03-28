require 'spec_helper'

feature "hidden links" do
  let(:user) { Factory(:user) }
  let(:admin) { Factory(:admin_user) }
  let(:product) { Factory(:product) }

  context "anonymous users" do
    scenario "cannot see the New Product link" do
      visit '/'
      assert_no_link_for "New Product"
    end
    scenario "cannot see the Edit Product link" do
      visit product_path(product)
      assert_no_link_for "Edit Product"
    end
    scenario "cannot see the Delete Product link" do
      visit product_path(product)
      assert_no_link_for "Delete Product"
    end
  end

  context "regular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Product link" do
      visit '/'
      assert_no_link_for "New Product"
    end
    scenario "cannot see the Edit Product link" do
      visit product_path(product)
      assert_no_link_for "Edit Product"
    end
    scenario "cannot see the Delete Product link" do
      visit product_path(product)
      assert_no_link_for "Delete Product"
    end
  end

  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the Add a new product link" do
      visit '/'
      assert_link_for "Add a new product"
    end
    scenario "can see the Edit Product link" do
      visit product_path(product)
      assert_link_for "Edit"
    end
    scenario "can see the Delete Product link" do
      visit product_path(product)
      assert_link_for "Delete"
    end
  end

end
