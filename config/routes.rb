Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root'user_info#index'
  #root'users#index'
  root to: 'home#top'
  get 'home/about'
  resources :users
  resources :books

  #get '/users/:id/index', to: 'users#index', as: 'index_user'
  # resources :users

  #get 'new' => 'users#new'
  #get 'users' => 'users#index'
  #post 'users' => 'users#create'

  # get 'edit' => 'users#edit'

  # resources :user, only: [:new, :create, :index, :show]

  # patch 'books/:id' => 'books/update', as 'update_books'

  # ログアウト
  # devise_scope :social_account do
  #   get 'sign_out', to: "sessions#destroy"
  # end

end
