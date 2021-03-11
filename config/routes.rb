Rails.application.routes.draw do
  devise_for :users
  # アクセスがあったら"items#index"へルーティングする
  root to: "items#index"
  resources :items do
    resources :histories, only:[:index, :create]
  end

end

