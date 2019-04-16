class AddressesController < ApplicationController
  before_action :set_user, only: [:new,:edit,:update]
  before_action :set_address, only: [:edit,:update]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      flash[:notice] = '発送先・お届け先住所の登録が完了しました'
      redirect_to profile_user_path(params[:user_id])
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def edit
  end

  def update
    @address.update(address_params)
    if @address.valid?
      flash[:notice] = '発送先・お届け先住所の変更が完了しました'
      redirect_to profile_user_path(params[:user_id])
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:postal_code,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: params[:user_id])
  end
end
