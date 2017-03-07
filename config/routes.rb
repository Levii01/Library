Rails.application.routes.draw  do
  resources :borrow_books, path: 'book', as: 'book', only: [] do
    member do
      get 'borrow_new'
      get 'give_back'
    end
  end

  get 'my_books', to: 'users#index'

  resources :books
  root to: 'home#index'

  devise_for :users
end
