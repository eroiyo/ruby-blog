# frozen_string_literal: true

class ApplicationController < ActionController::Base
  @current_user = User.first
  def current_user
    @current_user = User.first
  end
  protect_from_forgery with: :null_session
end
