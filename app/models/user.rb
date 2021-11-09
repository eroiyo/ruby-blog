# frozen_string_literal: true

class User < ApplicationRecord
  def recent_posts(limit = 3)
    posts.includes(:comments).order('created_at').last(limit)
  end
end
