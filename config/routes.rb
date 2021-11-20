# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  namespace :api do
    namespace :v1 do
      get 'users', to: 'users#index'
      get 'posts', to: 'posts#index'
      get 'posts/:post_id', to: 'posts#show'
      post 'posts/:post_id/comment', to: 'posts#comment'
      post 'users/sign_in', to: 'users#create'
      post 'users/login',  to: 'users#login'
    end
  end
  root to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'
  post '/users/:poster_id/posts/:post_id/create', to: 'comments#create'
  patch '/comment/delete', to: 'comments#delete'
  patch '/post/delete', to: 'posts#delete'
  get '/new_post', to: 'posts#creation'
  post '/create', to: 'posts#create'
  post '/like/create', to: 'likes#create'
  post '/like/delete', to: 'likes#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end