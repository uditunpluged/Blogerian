Rails.application.routes.draw do

  devise_for :users
  # resources :posts
  # IN ORDER TO NEST COMMENTS ROUTES INSIDE THE POST ROUTES , DO FOLLOWING AND COMMENT ABOVE ONE
  resources :posts do
    resources :comments
  end
  root 'posts#index'
  get '/about', to:'pages#about'

  scope 'v1' do
    get 'posts' => 'v1/posts#index'

    post 'users/sign_in' => 'v1/users#login'
  end
end
