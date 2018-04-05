Rails.application.routes.draw do
  devise_for :users
  resources :devices
  root to: 'home#index'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'techupdates/all', to: 'techupdates#get_all'
      get 'techupdates/active', to: 'techupdates#get_active'
      #publish notification to specific device
      match 'publish_notification/', to: 'publish_notifications#create', via: [:post]
      match 'publish_notification/new', to: 'publish_notifications#new', via: [:get]
    end
  end
end
