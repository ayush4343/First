class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
     add_column :products, :category_type ,:integer , default: 0
  end
end
