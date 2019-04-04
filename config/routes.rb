Rails.application.routes.draw do

  root 'items#index'

  resources :items  do
    resources :sold, only: [:index, :show]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'list' => 'users#list'

  devise_scope :user do
    get 'second' => 'users/registrations#new'
    get 'third' => 'users/registrations#new'
    get 'forth' => 'users/registrations#new'

    post 'second' => 'users/registrations#second'
    post 'third' => 'users/registrations#third'
    post 'forth' => 'users/registrations#forth'
  end    

  resources :users, only: [:index, :show] do
    member do
      get 'identification'
      get 'register_card'
      get 'profile'
      get 'logout'
    end
  end

end