# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def current_user(0)
        return users.find(0)
      end
end
