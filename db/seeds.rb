# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#admin_user = User.create(:email => "admin@example.com", :password => "admin")
#admin_user.admin = true
#admin_user.confirm!

Product.create(
               :name => "Seeded Product 1", 
               :manufacturer => "M1", 
               :price => "$3.69",
               :size  => "large",
               :upc => "324234234242"
               )

Product.create(
               :name => "Seeded Product 2", 
               :manufacturer => "M2", 
               :price => "5.99",
               :size  => "medium",
               :upc => "78686876876"
               )

Product.create(
               :name => "Seeded Product 3", 
               :manufacturer => "M3", 
               :price => "$19.99",
               :size  => "small",
               :upc => "65466546456"
               )

