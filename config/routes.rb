Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  resources :users, :only => [:index, :show]
  get 'mypage/identification' => 'users#identification'
  get 'mypage/card/create' => 'users#card'
  resources :items  do
    resources :sold, only: [:index, :show]
  end

end
