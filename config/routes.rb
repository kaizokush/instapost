Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   authenticated :user do
  #     root 'posts#index', as: :authenticated_root
  #   end
  #
  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    resources :comments
    resources :upvotes, only: :create
    resources :downvotes, only: :create
  end
  resources :users, only: :show
end
