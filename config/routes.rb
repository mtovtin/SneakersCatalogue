Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#index'
  resources :sneakers, only: [:index,:show]
  get :search, to: 'sneakers#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get :set_page, to: 'sneakers#set_page'
  resources :categories, only: %i[index show]
end
