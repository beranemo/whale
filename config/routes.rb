Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "members#index"
  resources :members, only: [:index,:new,:create]
end
