# frozen_string_literal: true

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
