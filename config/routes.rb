Qdx::Application.routes.draw do
  root to: 'products#index'

  devise_for :users
  devise_for :admins

  resources :product_attach_images do
    get 'product_images', on: :member
  end

  resources :categories
  resources :product_params
  resources :products
end
