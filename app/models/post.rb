# frozen_string_literal: true

belongs_to :user, counter_cache: :posts_counter
has_many :users, through: :likes, counter_cache: :likes_counter
has_many :comments, dependent: :destroy
has_many :likes, counter_cache: :likes_counter

class Post < ApplicationRecord
  def recent_comments(limit = 5)
    comments.last limit
  end

  def update_counter(value)
    user.update posts_counter: value
  end

  def liked?(id)
    users.exists? id
  end
end
