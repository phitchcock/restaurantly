Rails.application.routes.draw do
  root "pages#index"

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  #devise_scope :user do
    #get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end
  
  resources :categories do
    resources :restaurants
  end
end
