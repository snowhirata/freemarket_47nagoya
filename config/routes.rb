Rails.application.routes.draw do

  root 'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'list' => 'users#list'

  resources :users, only: [:index, :show] do
    member do
      get 'identification'
      get 'register_card'
      get 'profile'
      get 'logout'
    end
  end

  resources :items  do
    resources :sold, only: [:index, :show]
    resources :bought
  end

  resources :user_steps, only: [:index, :show, :update]
end
