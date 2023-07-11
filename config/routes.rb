Rails.application.routes.draw do
  namespace :admin do
    resources :records, only: [:index,:show,:edit,:update]
    
    resources :songs, only: [:index,:show,:edit,:update]
    
    resources :users, only: [:index,:show,:edit,:update]

  end
  
  scope module: :public do
    root to: 'homes#top'

    resources :records, only: [:new,:create,:show]

    resources :songs, only: [:new,:create,:index,:show] do
      resources :bookmarks, only: [:create,:destroy]
    end

    resources :users, only: [:show,:edit,:update]
    get 'users/check'
    patch 'users/withdraw'
    
    
  end


  devise_for :admins, skip: [:registrations,:passwords], controlleres:{
  sessions: 'admin:sessions'
  }

  devise_for :users, skip: [:passwords], controlleres:{
    registrations: 'public/registrations',
    sessions: 'public:sessions'
  }

  devise_scope :user do
    post"guest_sign_in",to: "public/sessions#guest_sign_in"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
