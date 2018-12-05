json.extract! blog, :id, :title, :author, :published_date, :content, :created_at, :updated_at
json.url blog_url(blog, format: :json)
