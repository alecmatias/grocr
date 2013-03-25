class AddImageUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :productImageUrl, :string
  end
end
