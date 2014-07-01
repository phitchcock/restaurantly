Rails.application.routes.draw do
  root "pages#index"
  
  resources :categories do
    resources :restaurants
  end
end
