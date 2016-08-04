class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.text :content
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :listings, [:user_id, :created_at]
  end
end
