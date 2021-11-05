class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.string :integer
      t.integer :likes_counter

      t.timestamps
    end
  end
end
