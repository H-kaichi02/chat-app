Rails.application.routes.draw do
  get 'messages/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
  
  devise_for :users, modules: [:database_authenticatable, :registerable,
                               :recoverable, :rememberable, :validatable, :confirmable]

  resources :rooms
end
