Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/destroy', :as => 'logout'

  get 'auth/google_oauth2', :as => 'google_auth'
  match 'auth/:provider/callback' => 'sessions#create', :via => [:post, :get]

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "pages#index"
  get 'profile', to: "pages#profile"
  get 'friends', to: "pages#friends"

  resources :users
end
