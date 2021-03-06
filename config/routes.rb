Rails.application.routes.draw do
  #définition de toutes les routes avec la page d'accueil en racine
      root 'static_pages#index'
  #get '/:first_name', to: 'static_pages#accueil', as: 'accueil'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  #la route welcome ne sert concrétement à rien et est là juste pour l'exemple
  get '/welcome/:first_name', to: 'static_pages#welcome'
  #get '/gossip/:gossip_id', to: 'static_pages#gossip'
  #get '/gossip/:gossip_id/profil/:user_id', to: 'static_pages#profil', as: 'profil'
  resources :gossips do
    resources :comments
    resources :likes, only:[:create, :destroy]
  end 
  resources :users
  resources :cities
  resources :sessions
  # resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
