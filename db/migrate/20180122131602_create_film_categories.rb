class CreateFilmCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :film_categories do |t|
      t.references :film
      t.references :category

      t.timestamps
    end
    add_index :film_categories, [:film_id, :category_id], unique: true
  end
end
