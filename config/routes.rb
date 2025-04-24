Rails.application.routes.draw do
  get 'messages/index'
  root to: "messages#index"
  
  # 修正: devise_forの引数にモデル名（:usersなど）を指定する
  devise_for :users, modules: [:database_authenticatable, :registerable,
                               :recoverable, :rememberable, :validatable, :confirmable]
end
