Rails.application.routes.draw do

resources :sessions, :only => [:new, :create, :destroy]
resources :users
resources :beers
resources :beer_categories
  get 'sessions/new'
  get '/contact', :to => 'pages#contact'
  get '/about',   :to => 'pages#about'
  get '/help',    :to => 'pages#help'
  get '/collection', :to => 'pages#collection'
  get '/signup',  :to => 'users#new'
  get '/users',   :to => 'users#show'
  post '/mlogin', :to => 'users#mlogin'

  get '/signin',  :to => 'sessions#new'
  get '/signout', :to => 'sessions#destroy', via: 'delete'
  #get '/', :to => 'pages#home'
  root :to => 'pages#home'

  ## API ROUTES ##
  post '/api_login', :to => 'users#api_login'
  get '/api_login', :to => 'users#api_login'

  post '/api_register', :to => 'users#api_register'
  get '/api_register', :to => 'users#api_register'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/catalogue', :to => 'beer_categories#index'
  post '/catalogue', :to => 'beer_categories#index'
  
  
  get '/bonplans', :to =>'deals#index'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
