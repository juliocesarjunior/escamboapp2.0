Rails.application.routes.draw do

  namespace :site do
    get  'home', to: 'home#index'
  end

  # namespace :backoffice do
  #   get 'dashboard', to: 'dashboard#index'
  # end
  get 'dashboard', to: 'backoffice/dashboard#index'

  devise_for :members
  devise_for :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "site/home#index" 

end
