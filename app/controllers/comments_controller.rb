# frozen_string_literal: true

class CommentsController < ApplicationController
    def create
        @comment =Comment.new
        temp =params[:comment]
        text = temp[:text]
        @comment.text = text
        user =current_user
        user.id
        @comment.user_id =user.id
        @comment.post_id =params[:post_id]
        
        if @comment.save
            redirect_to(request.env['HTTP_REFERER'])
        end
    end
end
  