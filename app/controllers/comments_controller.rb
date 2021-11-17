# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    user = current_user
    temp = params[:comment]
    text = temp[:text]

    @comment.text = text
    @comment.user_id = user.id
    @comment.post_id = params[:post_id]

    redirect_to(request.env['HTTP_REFERER']) if @comment.save
  end

  def delete
    user = current_user
    comment_id = params[:comment_id]
    Comment.delete_by(id: comment_id, user_id: user.id)
    redirect_to(request.env['HTTP_REFERER'])
  end
end
