class AddImageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :image, :string
    add_column :products, :thumbnail, :string
  end
end
