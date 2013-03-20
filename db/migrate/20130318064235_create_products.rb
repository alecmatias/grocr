class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :manufacturer
      t.integer :price
      t.string :size
      t.string :upc

      t.timestamps
    end
  end
end
