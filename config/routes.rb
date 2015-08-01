Rails.application.routes.draw do
  resources :products
  resources :catalogs
  get '/list_catalog', to: 'lists#list_catalog'
  get '/list_product', to: 'lists#list_product'
  root to: 'catalogs#index'
end
