Rails.application.routes.draw do
  get 'home/index'
  root to: 'items#index'
end
