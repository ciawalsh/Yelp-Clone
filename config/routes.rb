Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :restaurants do        # same as --> get 'restaurants' => 'restaurants#index'
    resources :reviews
  end
  
  root to: "restaurants#index"

end
