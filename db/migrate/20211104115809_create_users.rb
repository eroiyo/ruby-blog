class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :photo
      t.text :bio
      t.integer :posts_counter
      t.timestamps
    end
  end
end
