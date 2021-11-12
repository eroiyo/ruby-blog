# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    temp = params[:comment]
    text = temp[:text]
    @comment.text = text
    user = current_user
    @comment.user_id = user.id
    @comment.post_id = params[:post_id]

    redirect_to(request.env['HTTP_REFERER']) if @comment.save
  end
end
