Rails.application.routes.draw do
  resources :devices

  #publish notification to specific device
  match 'publish_notification/', to: 'publish_notifications#create', via: [:post]
  match 'publish_notification/', to: 'publish_notifications#show', via: [:get]
  match 'publish_notification/new', to: 'publish_notifications#new', via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
