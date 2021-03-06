Rails.application.routes.draw do
  devise_for :users
  # アクセスがあったら"items#index"へルーティングする
  root to: "items#index"
  resources :items, only:[:new, :create, :show, :edit, :update]

end

