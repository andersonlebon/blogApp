Rails.application.routes.draw do
  get 'users/:user_id/posts', to: "posts#index"
  get 'users/:user_id/posts/:id', to: "posts#show"
  get 'users/', to: "users#index"
  get 'users/:id', to: "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
