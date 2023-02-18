Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :splash_screen , only: [:index]
  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated do
      root 'splash_screen#index',  as: :unauthenticated_root
    end
  end
  
  resources :groups do
    resources :entities
  end


end
