Rails.application.routes.draw do
  resources :tasks
  devise_for :users, controllers: { registrations: "registrations" }
  #generate routes to access the next signup forms
  resources :sign_up, :controller => :after_signup
  root to: 'static#index'
  resources :users
end
