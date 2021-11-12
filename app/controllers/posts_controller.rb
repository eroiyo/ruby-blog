# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end

  def show
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all
    @comment.user_id = current_user.id
  end

  def create
    @post = Post.new
    @post.user_id = current_user.id
    @post.likes_counter = 0
    @post.comments_counter = 0
  end
end
