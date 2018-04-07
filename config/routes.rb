Rails.application.routes.draw do

  match '/split' => Split::Dashboard, anchor: false, via: %i[get post delete], constraints: ->(request) do
    request.env['warden'].authenticated? # are we authenticated?
    request.env['warden'].authenticate_client! # authenticate if not already
    request.env['warden'].manager
  end

  devise_for :managers, controllers: {
      registrations: 'managers/registrations',
      passwords: 'managers/passwords',
      sessions: 'managers/sessions'
  }
  devise_for :clients, controllers: {
      registrations: 'clients/registrations',
      passwords: 'clients/passwords',
      sessions: 'clients/sessions'
  }

  authenticated :client do
    root 'client_dashboard#index'
  end

  authenticated :manager do
    root 'manager_dashboard#index'
  end

  namespace :loafgo_api, defaults: {format: :json} do

  end

  mount API => '/'

  controller :home do
    get 'home/index', to: 'home#index', as: 'home'
    get 'home/about', to: 'home#about', as: 'about'
    get 'home/contact', to: 'home#contact', as: 'contact'
    get 'home/sign_up_portal', to: 'home#sign_up_portal', as: 'sign_up_portal'
    get 'home/login_portal', to: 'home#login_portal', as: 'login_portal'
    get '/markdown', to: 'home#markdown'
  end

  resources :breads do
    post :get_barcode, on: :collection
  end

  controller :manager_dashboard do
    get 'm_dashboard', to: 'manager_dashboard#index', as: :manager_dashboard
  end

  controller :manager_order_tracker do
    get 'manager_order_tracker', to: 'manager_order_tracker#index', as: :manager_order_trackers
  end

  controller :client_dashboard do
    get 'c_dashboard', to: 'client_dashboard#index', as: :client_dashboard
  end
  controller :order_finder do
    get 'order_finder', to: 'order_finder#index', as: :order_finder
  end

  resources :deliveries
  resources :orders
  resources :order_feedbacks, except: [:new, :destroy]
  resources :order_trackers
  resources :trucks
  resource :warehouse, only: %i[edit show update]

  root to: 'home#index'
end
