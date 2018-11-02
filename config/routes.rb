# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shopping_lists#index'

  resources :shopping_lists do
    put :make_primary

    resources :items do
      put :toggle_checked
      put :increment_quantity
      put :decrement_quantity
    end
  end

  namespace :slack do
    resources :orders, only: [:create]
  end

  resources :welcome_message, only: :index
end
