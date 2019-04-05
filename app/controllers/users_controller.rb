class UsersController < ApplicationController
  before_action :set_user, only: [:show, :identification, :register_card, :profile, :logout]
  def index
  end

  def show
  end

  def identification
  end

  def register_card
  end

  def profile
  end

  def logout
  end

  def list
  end

  def setuser
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],

    )
    @user.save

    @address = Address.new(
      user_id: @user.id,
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      phone_number: session[:phone_number]
    )
    @address.save

    @credit = Credit.new(
      user_id: @user.id,
      card_number: session[:card_number],
      exp_month: session[:exp_month],
      exp_year: session[:exp_year],
      security_code: session[:security_code]
    )
    binding.pry
    @credit.save

    redirect_to complete_path
  end

  def complete

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
