Rails.application.routes.draw do
  devise_for :users
  root "pages#index"
  
  resources :categories do
    resources :restaurants
  end
end
