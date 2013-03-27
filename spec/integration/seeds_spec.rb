require 'spec_helper'

feature "Seeding database" do
  let!(:user) {Factory(:user)}

  before do
    sign_in_as!(user)
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
