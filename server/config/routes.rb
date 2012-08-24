Server::Application.routes.draw do

  resources :calendars

  match 'dates', :to => 'calendars#index'

  require 'api_constraints'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users
      resources :roles
      resources :specialisms
      resources :users do
        resources :roles
      end
      resources :sicks
      resources :patients

      put '/users' => 'users#update'
      post 'users' => 'users#new'
    end
  #future API V2, for request into header; 'Accept: application/vnd.medkinect.v2'
  #scope module: :v2, constraints: ApiConstraints.new(version: 2) do
  #  resources :users
  #end
  end

  root :to => 'login#index'
  get "login", :to => "login#index"
  get "login/index"
  post "login/login"
  get "login/logout"

  resources :sicks

  resources :patients

  resources :roles
  resources :specialisms
  resources :users do
    resources :roles
  end

  post 'users/login' , :defaults => { :format => 'json' }
  post 'users' => 'users#new'

  put '/users' => 'users#update'

  match  'users/:user_id/dates', :to => 'calendars#show_user_dates'

  match   'users/:user_id/dates/new', :to => 'calendars#new'

  put '/user/:id' => 'users#update'

  #match 'users/:id/rol' => 'roles#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => 'login#index'
  #get "users", :as => :root_loged
# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
