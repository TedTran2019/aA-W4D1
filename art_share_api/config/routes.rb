Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit] do 
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, except: [:new, :edit, :index] do 
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy, :index]
end
