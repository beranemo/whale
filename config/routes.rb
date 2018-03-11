Rails.application.routes.draw do
  devise_for :users
  
   devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  namespace :cashier do
    root "members#index"
    resources :members do
      collection do
        get :search
        post :search_outcome
      end
      collection do 
        get :checkout
      end
      
    end
    
    resources :guests ,only:[:index,:new,:create] do
      collection do
        get :guest_today
      end
    end

  end

  root "members#index"
  resources :members, only: [:index,:new,:create]
end
