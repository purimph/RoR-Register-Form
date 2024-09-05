Rails.application.routes.draw do
  resources :registrations, only: [:index, :new, :create, :edit, :update]
  root 'registrations#new'
end