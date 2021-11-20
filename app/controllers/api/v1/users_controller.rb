# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      skip_before_action :authenticate_user!, only: [:create, :login]
      def create
        user = User.create(user_params)
        if user.save
          render json: { token: JsonWebToken.encode(sub: user.id) }, status: 200
        else
          render json: { message: user.errors.full_messages }, status: 400
        end
      end

      def index
        render json: { Posts: User.all }
      end

      def login
        @user = User.find_by_email(params[:email])
    if @user.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     name: @user.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
      end

      private

      def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
      end
    end
  end
end
