Rails.application.routes.draw do
  get 'my_books', to: 'users#index'

  get 'users/show'

  resources :books
  root to: 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
