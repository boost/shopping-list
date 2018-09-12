Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lists do
    resources :items do
      put :toggle_checked
    end
  end

  root 'lists#index'
end
