Rails.application.routes.draw do







  root 'items#index'

  resouces :items, :only => [:index, :create, :show, :edit, :update, :destroy]
end
