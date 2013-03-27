class Item < ActiveRecord::Base

  attr_accessible :product_id, :quantity, :product

  belongs_to :product
  belongs_to :list

  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }

end
