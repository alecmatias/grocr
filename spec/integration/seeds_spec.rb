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
    page.should have_content 'Seeded Product 1'
    page.should have_content 'Seeded Product 2'
    page.should have_content 'Seeded Product 3'
  end
end
