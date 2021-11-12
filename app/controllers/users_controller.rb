# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @current_user = current_user
    @users = User.all
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
