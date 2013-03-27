# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.create(:email => "admin@example.com", :password => "adminpassword")
admin_user.admin = true
admin_user.save!
#admin_user.confirm!

Product.create(
               :name => "Brawny Paper Towels",
               :manufacturer => "Georgia Pacific",
               :price => "$24.93",
               :size  => "20 rolls",
               :upc => "324234234242",
               :description => "<ul>" +
               "<li>20 giant rolls = 30 regular rolls</li>" +
               "<li> 69 sheets per roll</li>" +
               "<li>2 ply</li>" +
               "<li>Scrubs tough messes and soaks up spills</li>" +
               "<li>Ships in Certified Frustration-Free Packaging</li>" +
               "</ul>"
               )

Product.create(
               :name => "Bounty Paper Towels",
               :manufacturer => "Bounty",
               :price => "30.99",
               :size  => "15 rolls",
               :upc => "78686876876",
               :description => "<ul>" + 
               "<li>20 giant rolls = 30 regular rolls</li>" +
               "<li>69 sheets per roll</li>" +
               "<li>2 ply</li>" +
               "<li>Scrubs tough messes and soaks up spills</li>" +
               "<li>Ships in Certified Frustration-Free Packaging</li>" +
               "</ul>"
               )

Product.create(
               :name => "Scott Paper Towels",
               :manufacturer => "Scott",
               :price => "8.79",
               :size  => "6 rolls",
               :upc => "65466546456",
               :description => "<ul>" +
               "<li>60% Recycled 100% absorbent</li>" +
               "<li><Durable for tough messes/li>" +
               "<li>Choose-A-Size; Because messes don't come in one size fits all</li>" +
               "<li>Has earned the green good housekeeping seal</li>" +
               "<li>Packaging may vary from image shown</li>" +
               "</ul>"
               )
