Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  resources :users, :only => [:index, :show] do
    member do
      get 'identification'
      get 'card'
    end
  end

end