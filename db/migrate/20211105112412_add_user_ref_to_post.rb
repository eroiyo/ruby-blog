class AddUserRefToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :posts, null: false, foreign_key: true
  end
end
