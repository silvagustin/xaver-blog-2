Rails.application.routes.draw do  
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}  

  scope module: :public do    
  	resources :posts, only: [ :index, :show ]
  	resources :autores, only: :show
  end

  namespace :admin do
  	resources :posts
    root "posts#index"
  end

  root "public/posts#index", as: :public_root
end
