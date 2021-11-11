# frozen_string_literal: true

belongs_to :user
belongs_to :post, counter_cache: :likes_counter

class Like < ApplicationRecord
  def update_counter(value)
    post.update(likes_counter: value)
  end
end
