Rails.application.routes.draw do
# 会員

  #

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post "guest_sign_in",to: "public/sessions#guest_sign_in"
  end

  scope module: :public do
    root to: 'homes#top'

    get "search" => "songs#search"
    resources :songs, only: [:new,:create,:index,:show] do
      
      resources :records, only: [:new,:create,:show]
      resource :bookmarks, only: [:create,:destroy]
    end


    get 'users/check'
    patch 'users/withdraw'
    resources :users, only: [:show,:edit,:update]

  end

  # 管理者

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
     sessions: 'admin/sessions'
  }

  namespace :admin do
    
    resources :records, only: [:index]
    
    get "search" => "songs#search"
    resources :songs, only: [:index,:show,:edit,:update] do
      resources :records, only: [:show,:edit,:update,:destroy]
    end

    resources :users, only: [:index,:show,:edit,:update]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
