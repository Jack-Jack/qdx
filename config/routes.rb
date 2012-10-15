Qdx::Application.routes.draw do
  resources :product_attach_images do
    get 'product_images', on: :member
  end

  resources :categories
  resources :product_params
  resources :products
end
