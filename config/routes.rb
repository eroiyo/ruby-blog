# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
