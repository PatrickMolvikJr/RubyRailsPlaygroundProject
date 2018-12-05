class Product < ApplicationRecord
  #has_many :articles, dependent: :destroy
  has_many :product_reviews, dependent: :destroy
  validates_presence_of :name, :description, :quantity_on_hand
  validates_numericality_of :selling_price, :cost_of_product
  validates_numericality_of :shipping_weight, :greater_than => 0.0

end
