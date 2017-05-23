Rails.application.routes.draw do
  get 'likes/index'

  post :incoming, to: 'incoming#create'
  
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :likes, only: [:index]

  devise_for :users
  
  root 'welcome#landing'

  get 'welcome/about'
end

