# frozen_string_literal: true

class LikesController < ApplicationController

  def create
    @like = Like.new
    user = current_user
    @like.user_id = user.id
    post_id =params[:post_id]
    @like.post_id = post_id
    @post = Post.find(post_id)
    @post.likes_counter = (@post.likes_counter + 1)
    @post.save
    
    if @like.save
      redirect_to(request.env['HTTP_REFERER'])
    end
  end
  def delete
    @likes =Like.all
    user = current_user
    post_id = params[:post_id]
    post_id = post_id.to_i;
    many = Like.delete_by(post_id: post_id, user_id: user.id)
    @post = Post.find(post_id)
    @post.likes_counter = (@post.likes_counter - many)
    if @post.save
      redirect_to(request.env['HTTP_REFERER'])
    end
  end
end