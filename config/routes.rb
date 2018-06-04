Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'static#index'
  resources :after_signup
end
