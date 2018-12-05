json.extract! product_review, :id, :name, :review_text, :rating, :product_id, :created_at, :updated_at
json.url product_review_url(product_review, format: :json)
