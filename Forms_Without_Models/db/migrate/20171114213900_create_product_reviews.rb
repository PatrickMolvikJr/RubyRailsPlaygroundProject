class CreateProductReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :product_reviews do |t|
      t.string :name
      t.text :review_text
      t.integer :rating
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
