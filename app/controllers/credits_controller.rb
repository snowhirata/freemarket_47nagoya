class CreditsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @credit = Credit.new
  end

  def show
    @credit = Credit.find(params[:id])
  end

  def create
    @credit = Credit.new(credit_params)
    token = params[:credit][:payjp_token]
    customer = Mypayjp.create_customer(token)
    @credit.cus_id = customer.id
    if @credit.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @credit = Credit.find(params[:id])
  end

  def update
    @credit = Credit.find(params[:id])
    @credit.update(credit_params)
    if @credit.valid?
      redirect_to profile_user_path
    else
      @user = User.find(params[:user_id])
      render :edit
    end
  end

  def destroy
    @credit = Credit.find(:id)
    @credit.destroy
  end

  private

  def credit_params
    params.require(:credit).permit(:card_number, :exp_year, :exp_month, :security_code).merge(user_id: params[:user_id])
  end

end