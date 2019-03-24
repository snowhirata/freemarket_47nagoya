Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  resources :users, :only => [:index, :show]
=======







  root 'items#index'

  resources :items
>>>>>>> master
end
