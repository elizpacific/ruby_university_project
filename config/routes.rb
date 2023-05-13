Rails.application.routes.draw do
  resources :events
  get 'pages/home'
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#landing_page", as:'home'

  resources :libraries do
    member do
      get :purge_image
    end
  end
  resources :books
  resources :authors
  resources :genres

  get 'download', to: 'libraries#download'
  get 'download_one/:id', to: 'libraries#download_one',as: 'download_one'
  get 'csv_download', to: 'libraries#csv_download'

  delete "attachments/:id/purge", to: "attachments#purge", as: "purge_attachment"

end
