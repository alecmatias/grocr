class Product < ActiveRecord::Base
  attr_accessible :manufacturer, :name, :price, :size, :upc, :description, :image
  has_attached_file :image
end
