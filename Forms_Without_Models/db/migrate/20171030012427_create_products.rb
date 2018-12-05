class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity_on_hand
      t.decimal :selling_price
      t.decimal :cost_of_product
      t.decimal :shipping_weight

      t.timestamps
    end
  end
end
