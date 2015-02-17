Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  
  root to: 'users#home'
  get '/set-location', to: 'users#location'
  post '/set-location', to: 'users#set_location'
  post '/set-goal', to: 'users#set_goal'
  post '/set-location-button', to: 'users#set_location_button'
  get '/find-friends', to: 'users#find_friends'
  get '/messages/show', to: 'messages#show_all'
  get '/:username', to: 'users#show'
  get '/messages/new', to: 'messages#new'
  post '/messages/new', to: 'messages#create'
  get '/delete/:id', to: 'messages#delete'
  get '/messages/reply/:id', to: 'messages#reply'
  post '/messages/read', to: 'messages#read'
  get '/users/description', to: 'users#description'

  post '/users/description', to: 'users#description_update'

  post '/set-experience', to: 'users#set_experience'
  get '/workouts/new', to: 'workouts#new'
  post '/workouts/new', to: 'workouts#create'
  get '/:id/subscribe', to: 'subscriptions#create'
  get '/:id/subscription/delete', to: 'subscriptions#delete'
  get '/edit/image', to: 'users#image'
  post '/edit/image', to: 'users#addimage'
  get '/gravatar/link', to: 'users#gravatar_link'
  get '/search/users', to: 'users#search'
  get '/contact/fitbuddy', to: 'users#contact'
  # post 'subscriptions/new', to: 'subscriptions#create'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
