Rails.application.routes.draw do
  get 'order_finder/index'

  get 'manager_dashboard/index'

  get 'client_dashboard/index'

  devise_for :managers
  devise_for :clients
  controller :home do
    get 'home/index', to: 'home#index', as: 'home'
    get 'home/about', to: 'home#about', as: 'about'
    get 'home/contact', to: 'home#contact', as: 'contact'
    get 'home/sign_up_portal', to: 'home#sign_up_portal', as: 'sign_up_portal'
    get 'home/login_portal', to: 'home#login_portal', as: 'login_portal'
  end

  resources :breads do
    post :get_barcode, on: :collection
  end

  resources :deliveries
  resources :order_finder, only: [:index]
  resources :orders
  resources :order_feedbacks
  resources :order_trackers
  resources :trucks
  resource :warehouse, only: [:edit, :show, :update]

  root to: 'home#index'
end
