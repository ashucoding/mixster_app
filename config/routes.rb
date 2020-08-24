Rails.application.routes.draw do
  
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :drinks do
    resources :reviews, except: [:index]
  end
  
  get '/users/five_star_drinks', to:'drinks#five_star_drinks'

  root 'drinks#index'
end
