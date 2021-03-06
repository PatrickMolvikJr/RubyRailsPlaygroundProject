class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.datetime :published_date
      t.text :content

      t.timestamps
    end
  end
end
