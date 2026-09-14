Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :books, except: [:destroy] do
    member do
      get :confirm_delete
      delete :delete
    end
  end
  #Standard CRUD route for users, user_books, and the root points to User Books
  resources :users
  resources :user_books

  root "user_books#index"
end