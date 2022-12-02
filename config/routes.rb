Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/account', to: 'users/registrations#account'
    get 'users/profile', to: "users/registrations#profile"
    patch 'users/profile/update', to: 'users/registrations#profile_update'
  end

  
  get '/', to: 'top#index'
  get 'top/search', to: "top#search"

  resources :rooms, only: [:new, :create] do
   collection do
    get 'register'
    get 'index'
   end
  end
  
  
  resources :reservations, only: [:new, :create, :show] do
    collection do
      post 'confirm'
      get  'reserved'
    end
  end
  
  root :to => 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
