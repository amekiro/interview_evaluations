Rails.application.routes.draw do
  resources :openings
  resources :designations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/guide' => 'pages#guide'

  resources :participants
  get '/participants/program' => 'participants#indexProg'
  
  resources :designations
  resources :openings
  patch '/openings/:id/cancel' => 'openings#cancel', as: :cancel_opening
  patch '/openings/:id/reopen' => 'openings#reopen', as: :reopen_opening
end
