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

  devise_for :users, skip: :registrations, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end
end
