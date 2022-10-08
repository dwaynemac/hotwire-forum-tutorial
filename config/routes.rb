Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :discussions

  get "test_flash", to: "main#test_flash"

  # Defines the root path route ("/")
  root to: "main#index"
end
