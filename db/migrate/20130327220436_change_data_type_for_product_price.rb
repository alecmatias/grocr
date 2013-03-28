class ChangeDataTypeForProductPrice < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.change :price, :float
    end
  end

  def down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
