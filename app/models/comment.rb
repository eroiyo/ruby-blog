# frozen_string_literal: true
belongs_to :user
belongs_to :post, counter_cache: :comments_counter

class Comment < ApplicationRecord
  def update_counter(value)
    post.update(comments_counter: value)
  end
end
