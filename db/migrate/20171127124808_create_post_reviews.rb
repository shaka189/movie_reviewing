class CreatePostReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :post_reviews do |t|
      t.references :User
      t.references :Film
      t.string :title
      t.text :content
      t.boolean :approve

      t.timestamps
    end
  end
end
