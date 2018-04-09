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
        get :file_new
        post :import
      end
      
      member do
        get :create_successfully
        get :show_orders
      end
      
    end
    resources :products, only: [:new, :create, :index, :edit, :update, :show] do
      member do
        post :add_to_cart
        post :remove
        post :listing
      end
      collection do
        get :manage
        get :removed_list
        get :import_xlsx_new
        post :barcode_to_cart
        post :import_xlsx
        post :update_all
      end
    end

    resources :orders, only: [:index, :new, :create, :edit, :update , :show] do
      collection do
        get :sales_analysis_day
        get :sales_analysis_statement
        get :ranking_product
        get :ranking_user
        get :ranking_day
        get :ranking_hour
        get :not_pick
        get :today
        get :search
        post :search_outcome
      end

      member do 
        get :new_guest
        get :edit_products
        post :create_guest
        post :pick_up
        post :set_member
      end
    end

    resources :cart_items, only: [:destroy, :edit] do
      member do
        post :plus_quantity
        post :minus_quantity
        post :add_discount
      end

      collection do
        post :clear_coupon
        post :clear_cart
      end
    end
    
    resources :guests do
      collection do
        get :guest_today
        get :guest_analysis
        post :search_outcome
      end
    end

    resources :bulletins 
    resources :hair_types, only: [:index, :new, :edit, :destroy, :update, :create]
    resources :skin_types, except: [:show]
    resources :member_types, except: [:show]
    resources :guest_types, except: [:show]
    resources :countries, only: [:index] do
      member do
        post :remove
        post :listing
      end
    end
    resources :ages, except: [:show]
    resources :info_ways, except: [:show]
    resources :discount_methods, only: [:index] do
      member do
        post :remove
        post :listing
      end
    end
    resources :blogs
    resources :users, only: [:index, :new, :create] do
      member do
        post :to_resigned
        post :to_in_service
      end
    end
    resources :settings, only: [:index, :edit, :update]
    
  end
  
  resources :users, only: [:edit, :update]
  
  resources :members, only: [:new, :create, :show]
end
