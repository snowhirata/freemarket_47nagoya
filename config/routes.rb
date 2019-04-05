Rails.application.routes.draw do

  root 'items#index'

  resources :items  do
    resources :sold, only: [:index, :show]
  end

  #ユーザー周りのルーティング
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:index, :show] do
    member do
      get 'identification'
      get 'register_card'
      get 'profile'
      get 'logout'
    end
  end
  get 'list' => 'users#list'
  get 'setuser' => 'users#setuser'
  get 'complete' => 'users#complete'
  resources :uservalids, only:[:new,:create]
  resources :addressvalids, only:[:new,:create]
  resources :creditvalids, only:[:new,:create]


end