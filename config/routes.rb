Rails.application.routes.draw do
  
  devise_for :users
  resources :drinks do
    resources :reviews, except: [:index]
  end 
get '/users/five_star_drinks', to:'drinks#five_star_drinks'

  root 'drinks#index'
end
