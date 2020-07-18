Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'items#index'
  resources :items
  get 'categories/get_child', to: "categories#get_child"

  resources :purchases do
    collection do
      post :confirm 
    end
  end
end
