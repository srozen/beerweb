Rails.application.routes.draw do


resources :sessions, :only => [:new, :create, :destroy]
resources :users
resources :beers
resources :reviews
resources :beer_categories

resources :collections
resources :friends
resources :contacts, :only => [:new, :create]
resources :password_resets, :only => [:new, :create, :edit, :update]
resources :deals

  get 'sessions/new'
  get '/contact', :to => 'contacts#new'
  get '/about',   :to => 'pages#about'
  get '/help',    :to => 'pages#help'
  get '/collections', :to => 'collections#show'
  get '/collections', :to => 'collections#destroy'
  get '/friends', :to => 'friends#show'
  get '/signup',  :to => 'users#new'

  get '/friendsRequest', :to => 'users#friendsRequest'
  post '/mlogin', :to => 'users#mlogin'
  get '/password_resets', :to => 'password_resets#new'

  get '/signin',  :to => 'sessions#new'
  get '/signout', :to => 'sessions#destroy', via: 'delete'
  get '/reviews', :to => 'reviews#show'
  #get '/', :to => 'pages#home'
  root :to => 'pages#home'

  ## API ROUTES ##
  post '/api_login', :to => 'web_services#login'
  post '/api_register', :to => 'web_services#register'
  post '/api_beer_profile', :to => 'beers#show'
  post '/api_add_beer', :to => 'collections#add_beer'
  post '/api_collection', :to => 'collections#show'
  post '/api_delete_beer', :to => 'collections#delete_beer'
  get '/api_bars', :to => 'bars#index'
  get '/api_shops', :to => 'shops#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post '/api_catalogue', :to => 'beer_categories#index'
  get '/catalogue', :to => 'beer_categories#index'
  post '/catalogue', :to => 'beer_categories#index'

  post '/addFriend', :to => 'friends#addFriend'
  get '/addFriend', :to => 'friends#addFriend'

 get '/users',   :to => 'users#show'
  post '/users',   :to => 'users#show'

  get '/ajoutbonplan', :to =>'deals#new'
  get '/bonsplans', :to =>'deals#index'


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
