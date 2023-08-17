Rails.application.routes.draw do
  resources :groups do
    resources :expenses
  end
  get 'exTrack', to: 'users#landing_page', as: 'exTrack'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
end