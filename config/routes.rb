Rails.application.routes.draw do
  resources :registrations do
    collection do
      get :register_modal
    end
    member do
      get :confirm_modal
    end
  end
  root to: 'registrations#new'
end