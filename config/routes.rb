Rails.application.routes.draw do
  get 'welcome/index'
  resources :reviews
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'welcome/contact'

end
