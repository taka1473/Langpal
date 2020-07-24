Rails.application.routes.draw do
  resources :rooms, only: [:show, :create]
  
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'home#top'
  
end
