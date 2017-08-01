Rails.application.routes.draw do
  get 'push_notifications', to: 'push_notifications#push'
  root 'home#index'
end
