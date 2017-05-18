Rails.application.routes.draw do
  resources :topics

  devise_for :users
  
  root 'welcome#landing'

  get 'welcome/about'
end
