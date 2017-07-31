Rails.application.routes.draw do
  get 'push_notifications/:id/user/:user_id', to: 'push_notifications#push'
  root 'home#index'
end
