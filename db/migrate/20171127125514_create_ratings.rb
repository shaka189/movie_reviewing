class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :Film
      t.references :User
      t.integer :mark, default: 0

      t.timestamps
    end
  end
end
