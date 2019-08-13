Rails.application.routes.draw do
  resources :obras do
    get 'obras/pdfinventario'
  end
  devise_for :users,  controllers: {sessions: 'users/sessions'}
  get 'welcome/index' 
  get 'welcome/indexen'
  root'welcome#index'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  # your routes here...
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
