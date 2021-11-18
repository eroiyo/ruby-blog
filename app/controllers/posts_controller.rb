# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @like = Like.new
    @current_user = current_user
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @like = Like.new
    @current_user = current_user
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all
    @comment.user_id = current_user.id
  end

  def creation
    @post = Post.new
    @post.user_id = current_user.id
  end

  def create
    @post = Post.new
    @post.likes_counter = 0
    @post.comments_counter = 0
    user = current_user
    @post.user_id = user.id
    temp = params[:post]
    text = temp[:text]
    title = temp[:title]
    @post.text = text
    @post.title = title

    redirect_to("/users/#{user.id}/posts/#{@post.id}") if @post.save
  end

  def delete
    user = current_user
    post_id = params[:post_id]
    post = Post.find(post_id)
    poster_id = post.user_id
    if can? :destroy, post
      post.comments.each do |comment|
        Comment.delete_by(id: comment.id)
      end
      Post.delete_by(id: post_id)
    end
    redirect_to("/users/#{poster_id}")
  end
end
