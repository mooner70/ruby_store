Rails.application.routes.draw do
  root 'users#index'
  get 'login' => 'sessions#create', as: 'new_login'
  post 'login' => 'sessions#new', as: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'
  
  resources :users
  resources :products


#   Prefix Verb   URI Pattern               Controller#Action
#         root GET    /                            users#index
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show <----------
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#     products GET    /products(.:format)          products#index <----------
#              POST   /products(.:format)          products#create <----------
#  new_product GET    /products/new(.:format)      products#new <----------test
# edit_product GET    /products/:id/edit(.:format) products#edit
#      product GET    /products/:id(.:format)      products#show 
#              PATCH  /products/:id(.:format)      products#update <----------
#              PUT    /products/:id(.:format)      products#update
#              DELETE /products/:id(.:format)      products#destroy <----------
#      


  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

end
