Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get 'my_portfolio', to: "users#my_portfolio"
  get "search_stock", to: "stocks#search"
  resources :friendships
  get "friend", to: "users#my_friends"
  get "search_friend", to: "users#search"
  resources :users, only: [:show]

end
