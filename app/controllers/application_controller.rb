# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    users.find(0)
  end
end
