Rails.application.routes.draw do

  root 'items#index'

  match 'category_select', to: 'items#category_select', via: [:get, :post]
  match 'child_category_select', to: 'items#child_category_select', via: [:get, :post]
  #カテゴリ検索用
  match 'category_select_search', to: 'items#category_select_search', via: [:get, :post]
  match 'child_category_select_search', to: 'items#child_category_select_search', via: [:get, :post]

  resources :items  do
    resources :sold, only: [:index, :show, :update]
    resources :bought
  end
  get 'search' => 'items#search'
  get 'sort' => 'items#sort'

  #ユーザー周りのルーティング
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:index, :show, :update] do
    resources :credits
    resources :addresses
    member do
      get 'profile'
      get 'card_index'
      get 'identification'
      get 'logout'
    end
  end
  
  #会員登録で使うルーティング
  get 'list' => 'users#list'
  get 'setuser' => 'users#setuser'
  get 'complete' => 'users#complete'
  resources :uservalids, only:[:new,:create]
  resources :addressvalids, only:[:new,:create]
  resources :creditvalids, only:[:new,:create]

end
