Rails.application.routes.draw do
  devise_for :users

  get 'likes/index'

  post :incoming, to: 'incoming#create'
  
  resources :users, only: [:show]
  
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :likes, only: [:index]

  
  authenticated :user do 
    root :to => 'users#show', :as => :authenticated_root
  end
  
  root 'welcome#landing'

  get 'welcome/about'
end
