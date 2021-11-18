# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  belongs_to :post, counter_cache: :comments_counter

  def update_counter(value)
    post.update(comments_counter: value)
  end
end
