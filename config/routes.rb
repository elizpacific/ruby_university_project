Rails.application.routes.draw do
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#landing_page", as:'home'

  resources :libraries
  resources :books
  resources :authors
  resources :genres

end
