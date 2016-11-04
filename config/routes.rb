Rails.application.routes.draw do
  root to: 'pages#index'
  resources :pages, only: [:new]
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'pages#new', as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
