class AddUserRefToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :comments, null: false, foreign_key: true
  end
end
