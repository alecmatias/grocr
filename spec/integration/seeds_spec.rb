require 'spec_helper'

feature "Seeding database" do
  let!(:admin_user) {Factory(:admin_user)}

  before do
    sign_in_as!(admin_user)
  end

  scenario "List a product" do
    load Rails.root + "db/seeds.rb"
    visit '/'
    click_link 'List products'
    page.should have_content 'Brawny Paper Towels'
    page.should have_content 'Bounty Paper Towels'
    page.should have_content 'Scott Paper Towels'
  end
end
