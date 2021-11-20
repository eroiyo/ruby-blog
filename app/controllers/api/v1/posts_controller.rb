# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApiController
    skip_before_action :authenticate_user!, only: [:create]

      def create
        user = current_user.posts.create(post_params)
        if post.save
          render json: { post: post }, status: 200
        else
          render json: { message: post.errors.full_messages }, status: 400
        end
      end
      def comment
        {
          comment = Comment.create(post_params)
          comment.post_id = params[:post_id]
          if comment.save
            render json: { comment: post }, status: 200
          else
            render json: { message: comment.errors.full_messages }, status: 400
          end
        }
      end
      def index
        render json: { Posts: Post.all }
      end

      def show
        @post = Post.find(params[:post_id])
        render json: { Posts: @post, Comments: @post.comments }
      end

      private

      def post_params
        params.require(:post).permit(:title, :body)
      end
    end
  end
end
