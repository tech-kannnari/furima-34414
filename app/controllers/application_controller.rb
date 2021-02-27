class ApplicationController < ActionController::Base

  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # ENV[変数]←同じものがある場合上から順に適応されるので、変数名を変えるか削除する必要がある
      username == ENV["BASIC_AUTH_USERS"] && password == ENV["BASIC_AUTH_PASSWORDS"]
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :name, :last_kana, :kana, :birthday])
  end

end
