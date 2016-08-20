Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :providers
  devise_for :users, controllers: {sessions: 'sessions'}
end
