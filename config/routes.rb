Rails.application.routes.draw do
  get 'galerias/index'
  devise_for :users
  get 'welcome/index'
  resources :obras
  root'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
