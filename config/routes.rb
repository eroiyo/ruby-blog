Rails.application.routes.draw do
  get '/', to: 'users#index'
  get '/user/:id', to: 'users#show'
  get '/user/:id/post', to: 'posts#index'
  get '/user/:id/post/:post_id', to: 'posts#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
