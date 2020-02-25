Rails.application.routes.draw do



  get 'top' =>'books#top'
  get 'home/about' =>'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#top'
  resources :books

  resources :users, only: [:index, :show, :edit, :update, :destroy]



end
