Rails.application.routes.draw do

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :members

  devise_for :admins

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index" 

end
