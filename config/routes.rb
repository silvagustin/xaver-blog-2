Rails.application.routes.draw do  
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  scope module: :public do    
    resources :usuarios, only: [] do
      resources :posts, only: [ :index, :show ], shallow: true
    end
  end

  namespace :admin do
  	resources :posts
    root "posts#index"
  end

  root "public/posts#index", as: :public_root
end
