Rails.application.routes.draw do
  get 'galerias/new'
  get 'galerias/edit'
  get 'galerias/show'
  get 'galerias/index'
  devise_for :users
  get 'welcome/index'
  resources :obras do
  end
  root'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
