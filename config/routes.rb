Rails.application.routes.draw do
  namespace :admin do
    root 'dashboard#index'
  end
  resources :elder_videos
  resources :elder_shares
  resources :elder_gallaries
  resources :group_memberships
  resources :groups
  resources :friends
  devise_for :users
  resources :users
  get 'dashboard' => 'dashboard#index', as: :dashboard
  get "change_password" => 'users#change_password', as: :change_password
  put "update_password" => 'users#update_password', as: :update_password 
  root 'home#index'
  get 'accept_user' => 'users#accept_user', as: :accept_user
  get 'reject_user' => 'users#reject_user', as: :reject_user
  get 'remove_user' => 'users#remove_user', as: :remove_user
  get 'friend_request' => 'users#friend_request', as: :friend_request
  post 'delete_user' => 'group_memberships#delete_user'
  get 'find_friend' => 'friends#find_friend', as: :find_friend
  post "update_share", :to => "elder_shares#update_share"
  post "update_share_video", :to => "elder_shares#update_share_video"

  resources :conversations do
    resources :messages
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
