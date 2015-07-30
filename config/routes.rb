Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  devise_scope :admin do
    get 'admin', to: 'devise/sessions#new'
  end
  resources :posts
  resources :comments
  root to: 'posts#index'
end
