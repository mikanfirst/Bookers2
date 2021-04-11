Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => 'homes#about'
  resources :books 
  resources :users, only: [:show, :edit, :index, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' #　フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' #フォローを外す
end
