class AddressesController < ApplicationController

  def new
    @user = User.find(params[:id])
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    redirect_to profile_user_path
  end

  def edit
    @user = User.find(params[:user_id])
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.valid?
      redirect_to profile_user_path
    else
      @user = User.find(params[:user_id])
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: params[:user_id])
  end
end
