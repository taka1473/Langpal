Rails.application.routes.draw do
  resources :rooms, only: [:show, :create, :destroy]
  
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'home#top'
  get 'home' => 'home#top'
  get 'home/lobby/:id' => 'home#lobby'
  
end
