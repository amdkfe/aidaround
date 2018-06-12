Rails.application.routes.draw do
  resources :tasks do
  end
  devise_for :users, controllers: { registrations: "registrations" }
  #generate routes to access the next signup forms
  resources :sign_up, :controller => :after_signup
  root to: 'static#index'
  resources :users do
      member do
        get 'created_tasks'
      end
  end
end
