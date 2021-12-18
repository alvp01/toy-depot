Rails.application.routes.draw do
  get 'store/index'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'store#index'
end
