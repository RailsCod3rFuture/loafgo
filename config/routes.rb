Rails.application.routes.draw do
  get 'client_dashboard/index'

  devise_for :managers
  devise_for :clients
  controller :home do
    get 'home/index', to: 'home#index', as: 'home'
    get 'home/about', to: 'home#about', as: 'about'
    get 'home/contact', to: 'home#contact', as: 'contact'
  end
  root to: 'home#index'
end
