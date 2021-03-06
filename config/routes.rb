Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'home/index'
  get 'home/show'

  resources :keyword_replies

  post '/callback', to: 'linebot#callback'
end
