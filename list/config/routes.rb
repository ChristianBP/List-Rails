Rails.application.routes.draw do
  root 'public#sign_in'

  get 'public/sign_in'

  resources :users, :only => [:new, :create, :show]
  post 'users/login'

  resources :list_items, :only => [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
