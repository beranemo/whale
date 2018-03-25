Rails.application.routes.draw do
  devise_for :users
    
  devise_scope :user do
    
    authenticated :user do
      root 'cashier/guests#guest_today'
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  
  namespace :cashier do
    root "guests#guest_today"
    resources :members do
      collection do
        get :search
        get :birthday_this_month
        get :birthday_next_month
        post :search_outcome
        post :birthday_search
      end
      
      member do
        get :create_successfully
      end
      
    end
    resources :products, only: [:new, :index, :edit, :update] do
      member do
        post :add_to_cart
        post :remove
        post :listing
      end
      collection do
        post :barcode_to_cart
        post :import
        get :manage
        get :removed_list
      end
    end

    resources :orders, only: [:index, :new, :create, :edit, :update , :show] do
      collection do
        get :sales_analysis_day
        get :sales_analysis_month
        post :search_outcome_day
        post :search_outcome_month
        get :ranking
        get :ranking_week
        get :ranking_month
        get :ranking_user
      end

      member do 
        get :set_member
      end
    end

    resources :cart_items, only: [:destroy, :edit] do
      member do
        post :plus_quantity
        post :minus_quantity
        post :add_discount
      end
    end
    
    resources :guests do
      collection do
        get :guest_today
        post :search_outcome
        get :guest_analysis
      end
    end

    resources :bulletins 
    resources :discounts
    resources :hair_types
    resources :skin_types
    resources :member_types
    resources :guest_types
    resources :countries
    resources :ages
    resources :info_ways
    resources :discount_methods
    
  end
  
  resources :users, only: [:edit, :update]

#  root "members#index"
  resources :members, only: [:index, :new, :create, :show]
end
