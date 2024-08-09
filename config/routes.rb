Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create,:destroy]
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  
  

  get 'home/about' => 'homes#about', as: 'about'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
