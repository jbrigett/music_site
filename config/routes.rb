Rails.application.routes.draw do
  get 'songs/index'
  root 'singers#index'
  get 'singers/index'
  devise_for :users
  resources :singers do
      resources :songs, only: [:new, :create]
  end
  resources :songs


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
