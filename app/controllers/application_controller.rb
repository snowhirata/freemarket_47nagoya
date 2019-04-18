class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :categories

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def categories
    @categories = Category.where(depth: 1).order("id ASC")
    @child_categories = Category.where(depth: 2).where(main_category_id: params[:c_id]).order("id ASC").limit(14)
    @grand_child_categories = Category.where(depth: 3).where(sub_category_id: params[:g_id]).order("id ASC").limit(14)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:last_name,:first_name_kana,:last_name_kana,:birth_year,:birth_month,:birth_day,:postal_code,:prefecture_id,:city,:block,:building,:phone_number,:profit,:exp_month,:exp_year,:profile_detail])
  end

  def basic_auth #ベーシック認証
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
