Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get '/menu' => 'home#menu'
  get '/menu/:id' => 'home#yum'
  get '/contact' => 'home#contact'
  get '/about' => 'home#about'

  get '/admin' => 'admin#index'

  get '/code' => redirect('https://github.com/chandracarney/dinner-dash')

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/cart' => 'cart#show'
  delete '/cart' => 'cart#destroy'
  post '/menu_items/:id/add_to_cart' => 'cart#update'

  resources :orders, only: [:index, :show, :create, :update]
  get '/checkout' => 'orders#new'
  get '/my_orders' => 'orders#my_orders'

  resources :users
  scope module: :admin do
    resources :categories
    resources :menu_items
  end
end
