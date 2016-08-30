Rails.application.routes.draw do

  # resources :posts
  # IN ORDER TO NEST COMMENTS ROUTES INSIDE THE POST ROUTES , DO FOLLOWING AND COMMENT ABOVE ONE
  resources :posts do
    resources :comments
  end
  root 'posts#index'
end
