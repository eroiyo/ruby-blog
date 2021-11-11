# frozen_string_literal: true

has_many :posts, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes

class User < ApplicationRecord
  def recent_posts(limit = 3)
    posts.includes(:comments).order('created_at').last(limit)
  end
end
