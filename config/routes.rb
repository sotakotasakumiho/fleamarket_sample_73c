Rails.application.routes.draw do
  devise_for :users
  root 'top_page#index'
  resources :categories, only: [:index]
  resources :items, expect: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:new] 

  resources :purchases do
    collection do
      post :confirm 
    end
  end
end
