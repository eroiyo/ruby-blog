# frozen_string_literal: true

module ApplicationHelper
    def get_photo(user)
        user.photo.present? ? user.photo : "/images/pfp.jpg"
      end
end
