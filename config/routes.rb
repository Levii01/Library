Rails.application.routes.draw  do
  resources :borrow_books, path: 'book', as: 'book', only: [] do
    get 'borrow_new', on: :member
  end

  get 'my_books', to: 'users#index'

  get 'users/show'

  resources :books
  root to: 'home#index'

  devise_for :users
end
