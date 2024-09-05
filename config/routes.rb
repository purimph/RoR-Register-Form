Rails.application.routes.draw do
  resources :registrations, only: [:index, :new, :create, :edit, :update, :destroy]
  root 'registrations#new'
end

