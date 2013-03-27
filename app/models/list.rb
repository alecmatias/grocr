class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :products, :through => :items
  # accepts_nested_attributes_for

  def has_item?(product)
    items.detect{ |i| i.product_id == product.id}
  end
end
