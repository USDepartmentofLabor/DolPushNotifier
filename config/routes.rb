Rails.application.routes.draw do
  devise_for :users
  resources :devices
  root to: 'home#index'
  #publish notification to specific device
  match 'publish_notification/', to: 'publish_notifications#create', via: [:post]
  match 'publish_notification/', to: 'publish_notifications#show', via: [:get]
  match 'publish_notification/new', to: 'publish_notifications#new', via: [:get]

  namespace :api do
    namespace :v1 do
      get 'techupdates/all', to: 'techupdates#get_all'
      get 'techupdates/active', to: 'techupdates#get_active'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
