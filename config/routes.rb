Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  #devise_for :users
  #resources :devices
  root to: 'home#index'
  #publish notification to specific device
  match 'publish_notification/', to: 'publish_notifications#create', via: [:post]
  match 'publish_notification/', to: 'publish_notifications#show', via: [:get]
  match 'publish_notification/new', to: 'publish_notifications#new', via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
