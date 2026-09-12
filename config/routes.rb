Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :books, except: [:destroy] do
    member do
      get :confirm_delete
      delete :delete
    end
  end
  root "books#index"
end