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
    end

    resources :guests ,only:[:index,:new,:create]
  end

  root "members#index"
  resources :members, only: [:index,:new,:create]
end
