Rails.application.routes.draw do
  resources :registrations, only: [:index, :new, :create, :edit, :update, :data, :destroy] do
    member do
      get 'confirm_modal'
    end
  end
  root 'registrations#new'
end

