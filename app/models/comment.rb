# frozen_string_literal: true

class Comment < ApplicationRecord
    def update_counter(value)
        post.update(comments_counter: value)
      end
end
