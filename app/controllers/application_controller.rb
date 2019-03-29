class ApplicationController < ActionController::Base
  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:last_name,:first_name_kana,:last_name_kana,:birth_year,:birth_month,:birth_day,:postal_code,:prefecture_id,:city,:block,:building,:phone_number,:profit,:exp_month,:exp_year,:profile_detail])
  end

  def basic_auth #ベーシック認証
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
