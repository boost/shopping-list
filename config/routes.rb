Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'

  resources :lists do
    resources :items do
      put :toggle_checked
      put :increment_quantity
      put :decrement_quantity
    end
  end

  namespace :slack do
    resources :orders, only: [:create]
  end
end
