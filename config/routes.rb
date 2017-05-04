Rails.application.routes.draw do
  devise_for :usuarios
  get '/usuarios/:id', to: 'usuarios#show', as: 'usuario'

  resources :posts

  root 'posts#index'
end
