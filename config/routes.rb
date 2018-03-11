Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :cashier do
    root "members#index"
    resources :members do
      collection do
        get :search
        post :search_outcome
      end
      member do 
        get :checkout
      end  
    end
    resources :products, only:[:new] do
      member do
        post :add_to_order
      end
    end

    resources :order_items, only:[:destroy] do
      member do
        post :plus_quantity
        post :minus_quantity
      end
    end
    resources :guests ,only:[:index,:new,:create]

  end

  root "members#index"
  resources :members, only: [:index,:new,:create]
end
