Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # if user_signed_in? then
  root 'posts#index'
  # else
  # root 'posts#new'
  # end
  resources :posts do
    resources :comments
    resources :upvotes, only: :create
    resources :downvotes, only: :create
  end
  resources :users, only: :show
end
