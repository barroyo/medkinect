Server::Application.routes.draw do

  get 'home', :to => 'home#index', :as => :home
  get 'twitter', :to => 'twitter#index'
  get "twitter/index"
  get 'auth/twitter', :as => :twitter_authentication
  get "twitter/post"

  resources :calendars

  match 'dates', :to => 'calendars#index'

  require 'api_constraints'
  # custom API routes maping
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      
      #users controller
      post "users/login", :to => "users#login"
      get "users", :to => "users#index", :defaults => { :format => 'json' }
      get "users/:user_id", :to => "users#show", :defaults => { :format => 'json' }
      post "users/:user_id/update", :to => "users#update", :defaults => { :format => 'json' }
      post "users/:user_id/change_password", :to => "users#change_password", :defaults => { :format => 'json' }
      post "users/:user_id/delete", :to => "users#destroy", :defaults => { :format => 'json' }
      post "users/new", :to => "users#create", :defaults => { :format => 'json' }

      #roles controller
      get "roles", :to => "roles#index", :defaults => { :format => 'json' }
      get "roles/:role_id", :to => "roles#show", :defaults => { :format => 'json' }
      post "roles/:role_id/update", :to => "roles#update", :defaults => { :format => 'json' }
      post "roles/:role_id/delete", :to => "roles#destroy", :defaults => { :format => 'json' }
      post "roles/new", :to => "roles#create", :defaults => { :format => 'json' }

      #patients controller
      get "patients", :to => "patients#index", :defaults => { :format => 'json' }
      get "patients/:patient_id", :to => "patients#show", :defaults => { :format => 'json' }
      post "patients/:patient_id/update", :to => "patients#update", :defaults => { :format => 'json' }
      post "patients/:patient_id/delete", :to => "patients#destroy", :defaults => { :format => 'json' }
      post "patients/new", :to => "patients#create", :defaults => { :format => 'json' }

      #sicks controller
      get "sicks", :to => "sicks#index", :defaults => { :format => 'json' }
      get "sicks/:sick_id", :to => "sicks#show", :defaults => { :format => 'json' }
      post "sicks/:sick_id/update", :to => "sicks#update", :defaults => { :format => 'json' }
      post "sicks/:sick_id/delete", :to => "sicks#destroy", :defaults => { :format => 'json' }
      post "sicks/new", :to => "sicks#create", :defaults => { :format => 'json' }


      #sicks controller
      get "specialisms", :to => "specialisms#index", :defaults => { :format => 'json' }
      get "specialisms/:specialism_id", :to => "specialisms#show", :defaults => { :format => 'json' }
      post "specialisms/:specialism_id/update", :to => "specialisms#update", :defaults => { :format => 'json' }
      post "specialisms/:specialism_id/delete", :to => "specialisms#destroy", :defaults => { :format => 'json' }
      post "specialisms/new", :to => "specialisms#create", :defaults => { :format => 'json' }

      #calendars controller
      get "calendars", :to => "calendars#index", :defaults => { :format => 'json' }
      get "calendars/:calendar_id", :to => "calendars#show", :defaults => { :format => 'json' }
      get "calendars/user/:user_id", :to => "calendars#show_user_dates", :defaults => { :format => 'json' }
      post "calendars/:calendar_id/update", :to => "calendars#update", :defaults => { :format => 'json' }
      post "calendars/:calendar_id/delete", :to => "calendars#destroy", :defaults => { :format => 'json' }
      post "calendars/new", :to => "calendars#create", :defaults => { :format => 'json' }

    end
  #future API V2, for request into header; 'Accept: application/vnd.medkinect.v2'
  #scope module: :v2, constraints: ApiConstraints.new(version: 2) do
  #  resources :users
  #end
  end

  match "/auth/:provider/callback" => "integrations#create", :defaults => { :format => 'json' }
  root :to => 'home#index'
  get "login", :to => "login#index", :as => :login_path
  get "login/index"
  post "login/login"
  get "login/logout"


  resources :sicks

  resources :patients

  resources :roles
  resources :specialisms

  get 'users', :to => 'users#index', :as => :users
  get 'users/new', :to => 'users#new', :as => :new_user
  get 'users/:id', :to => 'users#show', :as => :user
  get 'users/:id/edit', :to => 'users#edit', :as => :edit_user
  post 'users', :to => 'users#create'
  put 'users/:id', :to => 'users#update'
  delete 'users/:id', :to => 'users#destroy'
=begin
  resources :users do
    resources :roles
  end
=end

  post 'users/login'
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
