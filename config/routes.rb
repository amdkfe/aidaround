Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  unauthenticated :user do
    root 'static#index', as: :authenticated_root
  end
  resources :tasks do
  end
  #generate routes to access the next signup forms
  resources :sign_up, :controller => :after_signup
  resources :users do
      member do
        get 'created_tasks' , 'assigned_tasks'
      end
  end
  root to: 'static#index'
end
