INeedABeer::Application.routes.draw do
  resources :histories

  resources :favorites

  devise_for :users
  resources :dashboard
  resources :favorites
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  ##### pointing to home controller and index action
  root 'home#index'
  get 'search' => 'home#search_breweries_by_location'

  get 'lsearch' => 'dashboard#search_breweries_by_location'
  get 'name_search' => 'dashboard#search_breweries_by_name'
  get 'search_by_id' => 'dashboard#search_breweries_by_id'
  get 'favorites/user/:user_id' => 'favorites#get_by_user'
  get 'histories/user/:user_id' => 'histories#get_by_user'
  get 'brewery_by_id' => 'dashboard#get_brewery_using_breweries_id'
  get 'categories' => 'dashboard#get_categories'
  get 'styles' => 'dashboard#get_styles'
  get 'beers' => 'dashboard#get_beers'


  get 'brewery/:id' => 'brewery#show'
  get 'brewery_show_by_id' => 'brewery#search_breweries_by_id'

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
