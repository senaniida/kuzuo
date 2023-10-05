Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "top" => "posts#top"
  get "posts/new" => "posts#new"
  resources :posts
  root "posts#top"
end
