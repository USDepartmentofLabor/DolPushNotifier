Rails.application.routes.draw do
  devise_for :users
  resources :devices
  root to: 'home#index'
  resources :techbits

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'techbits/all', to: 'techbits#all'
      get 'techbits/active', to: 'techbits#active'
      #publish notification to specific device
      match 'publish_notification/', to: 'publish_notifications#create', via: [:post]
      match 'publish_notification/new', to: 'publish_notifications#new', via: [:get]
      match 'device_token/', to: 'device_token#create_or_update', via: [:put,:post]
    end
  end
end
