Rails.application.routes.draw do
  devise_for :users
    
  devise_scope :user do
    
    authenticated :user do
      root 'cashier/members#index'
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  
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
    resources :products, only: [:new, :index, :edit, :update] do
      member do
        post :add_to_order
      end
    end

    resources :order_items, only: [:destroy] do
      member do
        post :plus_quantity
        post :minus_quantity
      end
    end
    
    resources :guests do
      collection do
        get :guest_today
      end
    end

  end

#  root "members#index"
  resources :members, only: [:index,:new,:create]
end
