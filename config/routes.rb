Rails.application.routes.draw do
  
  devise_for :users
  resources :drinks do
    resources :reviews, except: [:index]
  end 

  root 'drinks#index'
end
