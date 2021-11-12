# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  def recent_posts(limit = 3)
    posts.includes(:comments).order('created_at').last(limit)
  end
end
