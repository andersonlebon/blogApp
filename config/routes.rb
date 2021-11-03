Rails.application.routes.draw do
  get 'users/:user_id/posts', to: "posts#index"
  get 'users/:user_id/posts', to: "posts#index"
  get 'users/:user_id/posts', to: "posts#index"
  get 'users/:user_id/posts', to: "posts#index"
  
  get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
