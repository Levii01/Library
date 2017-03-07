Rails.application.routes.draw  do
  resources :borrow_books, path: 'book', as: 'book', only: [] do
    member do
      get 'borrow_new'
      get 'give_back'
    end
  end

  resources :books
  get 'history', to: 'borrow_books#history'
  get 'my_books', to: 'users#index'
  root to: 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
end
