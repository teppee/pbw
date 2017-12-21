Rails.application.routes.draw do
  root "home#index"
  get 'intro', to: 'home#intro'
  get 'tyrano', to: 'home#tyrano'
  
  get 'info', to: 'infos#index'

  resources :board_messages
  devise_for :users
  resources :characters
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
