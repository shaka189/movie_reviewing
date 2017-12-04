class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :User
      t.references :PostReview
      t.string :content

      t.timestamps
    end
  end
end
