Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show]
    root 'dashboard#index', to: 'dashboard'
    #root 'dashboard#index', as: :authenticated_root
  end

  namespace :site do
    get  'home', to: 'home#index'
  end


  devise_for :members
  devise_for :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "site/home#index"
  
  #get '/', to: redirect('site/home')


end
