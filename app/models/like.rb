# frozen_string_literal: true

class Like < ApplicationRecord
    def update_counter(value)
        post.update(likes_counter: value)
      end
end
