Psistemas::Application.routes.draw do
  
  get "ajax_calls/get_branches"
  
  get "mobile_services/index"
  get "mobile_services/get_driver_info"
  resources :client_branches

  resources :clients

  resources :error_reports

  resources :branches

  resources :companies

  devise_for :users
  devise_scope :user do
    get "devise/sessions/sign_out" => "devise/sessions#destroy", :as => :destroy_session
    match 'devise/registrations/:id/edit' => 'devise/registrations#edit', :as => :edit_user, :via => :get
    match 'devise/registrations' => 'users#index', :as => :registrations, :via => :get    
    match 'users/:id/edit' => 'users#edit', :as => :edit_admin_user, :via => :get
  end
  
  resources :users

  resources :roles

  get "welcome/index"
  get "welcome/index", :as => :welcome
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
