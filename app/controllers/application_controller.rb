class ApplicationController < ActionController::Base
  before_action :basic_auth
  # deviseに関するコントローラーの処理であれば、そのときだけconfigure_permitted_parametersメソッドを実行するように設定しています.
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # ENV[変数]←同じものがある場合上から順に適応されるので、変数名を変えるか削除する必要がある
      username == ENV['BASIC_AUTH_USERS'] && password == ENV['BASIC_AUTH_PASSWORDS']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :name, :last_kana, :kana, :birthday])
  end
end
