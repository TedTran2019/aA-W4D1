Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit] do 
    resources :artworks, only: [:index]
  end

  resources :artworks, except: [:new, :edit, :index]
end
