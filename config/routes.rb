Rails.application.routes.draw do
  devise_for :users
  # アクセスがあったら"items#index"へルーティングされますよ
  root to: "items#index"

end

