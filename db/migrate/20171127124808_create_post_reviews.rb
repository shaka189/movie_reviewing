class CreatePostReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :post_reviews do |t|
      t.references :user
      t.references :film
      t.string :title
      t.text :content
      t.boolean :approve

      t.timestamps
    end
  end
end
