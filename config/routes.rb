Rails.application.routes.draw do
  root "splash#index"

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'password',
    confirmation: 'verification',
    unlock: 'unlock',
    sign_up: 'signup',
    edit: 'edit'
  }, controllers: { registrations: 'registrations' }

  resources :categories, only: [:index, :new, :create] do
    resources :transactions, only: [:index, :new, :create]
  end

  delete "logout", to: "devise/sessions#destroy", as: :logout

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
