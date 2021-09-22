Rails.application.routes.draw do
  resources :tracks
  resources :exams
  resources :applications
  resources :openings
  resources :designations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # General Pages
  root 'pages#index'
  get '/guide' => 'pages#guide'

  # Employee List
  resources :participants
  get '/participants/program' => 'participants#indexProg'
  
  # Designation List
  resources :designations

  # Openings List
  resources :openings
  patch '/openings/:id/cancel' => 'openings#cancel', as: :cancel_opening
  patch '/openings/:id/reopen' => 'openings#reopen', as: :reopen_opening

  # Applications List
  get '/open_roles' => 'opening#open'
end
