Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'timelines#show'

  resource :profile, only: [:show, :edit, :update]

  resources :accounts, only: [:show] do
    resource :follow, only: [:show, :create, :destroy]
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end

  resources :posts, only: [:show, :new, :create] do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:show, :create, :destroy]
  end
end
