Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  root 'users#show'
  get 'about' => 'homes#about'
  resources :books
  resources :users, only: [:show, :edit]
end
