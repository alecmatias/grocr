class Item < ActiveRecord::Base

  attr_accessible :product_id, :quantity

  belongs_to :product
  belongs_to :list

end
