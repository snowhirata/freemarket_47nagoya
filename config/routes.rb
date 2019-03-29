Rails.application.routes.draw do
  root 'items#index'

  resources :items  do
    resources :sold, only: [:index, :show]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get 'sign_up/list' => 'users/registrations#list'
    get 'sign_up/address' => 'users/registrations#address'
    get 'sign_up/card' => 'users/registrations#card'
    get 'sign_up/complete' => 'users/registrations#complete'
  end

  resources :users, only: [:index, :show] do
    member do
      get 'identification'
      get 'register_card'
      get 'profile'
      get 'logout'
    end
  end

  resources :user_steps, only: [:index, :show, :update]

end