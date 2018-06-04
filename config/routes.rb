Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'static#index'
  #generate routes to access the next signup forms
  resources :sign_up, :controller => :after_signup
end
