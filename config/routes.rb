Rails.application.routes.draw do
  match "/comments", to: "dinners#index", :via => 'get'
  get 'home/welcome'
  get 'home/login'
  get 'home/about'
  get 'home/contact'
  authenticated :user do
    root :to => "dinners#index", :as => :auth_root
    # Rails 4 users must specify the 'as' option to give it a unique name
    # root :to => "main#dashboard", :as => "authenticated_root"
  end  
  root 'home#welcome'
  get 'dinners/join/:id' => 'dinners#join', as: :join_dinner
  get 'dinners/leave/:id' => 'dinners#leave', as: :leave_dinner

  resources :comments
  resources :dinners
  devise_for :users

  

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
