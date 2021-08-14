Rails.application.routes.draw do
  get 'users/profile/:id', to: 'users#show', as: 'profile'
  devise_for :users, :path_prefix => 'my'
  resources :users
  resources :stories
  root 'stories#index'
  get 'users/dashboard/:id', to: 'users#dashboard', as: 'panel_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
