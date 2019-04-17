class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :identification, :register_card, :profile, :logout]
  
  def index
  end

  def show
    @buyitems = Item.where(buyer_id: params[:id]) 
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save(validate: false)
      flash[:notice] = '変更が完了しました' 
      redirect_to profile_user_path(@user)
    else
      render :profile
    end
  end

  def identification
  end

  def card_index
    if current_user.credit
      @num = current_user.credit.card_number
      @num[0..9] = "**********"
      @exp_month = current_user.credit.exp_month
      @exp_year = current_user.credit.exp_year
      @brand = current_user.credit.brand
    end
  end

  def profile
  end

  def logout
  end

  def list
  end

  def sold_item
    @sold_item = @user.items
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
      security_code: session[:security_code],
      cus_id: session[:cus_id],
      brand: session[:brand]
    )
    @credit.save

    redirect_to complete_path
  end

  def complete

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname,:profile_detail,address_attributes: [:id,:postal_code, :prefecture_id, :city, :block, :building])
  end

end
