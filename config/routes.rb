Rails.application.routes.draw do







  root 'items#index'

  resources :items  do
    resources :sold, only: [:index, :show]
  end
end
