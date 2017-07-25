Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  get 'users' => 'users#index'

  post 'users' => 'users#create'

  get 'users/new' => 'users#new', :as => 'new_user'

  get 'users/:id/edit' => 'users#edit' , :as => 'edit'

  resources :users, only: [:show] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  # resources :users, only: [:show] do
  #   resources :comments, only: [:index]
  # end
  # get 'users/:id' => 'users#show', :as => 'user' do
  #   resources :artworks, only: [:index]
  # end

  patch 'users/:id' =>'users#update'

  put 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  resources :artworks, only: [:show, :update, :destroy, :create]

  resources :artworks, only: [:show] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

  resources :users do
    get 'favorite_artwork', :on => :member
  end
end
