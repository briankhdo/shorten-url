Rails.application.routes.draw do
  resources :urls, only: %i[create]
  root to: 'home#index'
  get ':key', to: 'home#redirect'
end
