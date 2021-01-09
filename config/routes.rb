Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'items#index'
end
