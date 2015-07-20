Rails.application.routes.draw do
  devise_for :admins
  devise_scope :admin do
    get 'admin', to: 'devise/sessions#new'
  end
  resources :posts
  root to: 'posts#index'
end
