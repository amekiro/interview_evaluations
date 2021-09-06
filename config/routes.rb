Rails.application.routes.draw do
  resources :openings
  resources :designations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/guide' => 'pages#guide'

  resources :participants
  resources :designations
  resources :openings
end
