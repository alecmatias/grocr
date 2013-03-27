class Product < ActiveRecord::Base
  attr_accessible :manufacturer, :name, :price, :size, :upc, :description

  def to_s
    name
  end
end
