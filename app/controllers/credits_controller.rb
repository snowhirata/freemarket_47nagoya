class CreditsController < ApplicationController
  before_action :set_user ,only: [:new, :create, :edit, :update]
  before_action :set_credit ,only: [:show, :edit, :update]

  def new
    @credit = Credit.new
  end

  def show
  end

  def create
    @credit = Credit.new(credit_params)
    token = params[:credit][:payjp_token]
    customer = Mypayjp.create_customer(token)
    @credit.cus_id = customer.id
    if @credit.save
      flash[:notice] = 'クレジットカードの登録が完了しました'
      redirect_to card_index_user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @credit.update(credit_params)
    if @credit.valid?
      flash[:notice] = 'クレジットカードの変更が完了しました'
      redirect_to card_index_user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @credit = Credit.where(user_id: params[:user_id])
    @credit.destroy(params[:id])
    redirect_to card_index_user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_credit
    @credit = Credit.find(params[:id])
  end

  def credit_params
    params.require(:credit).permit(:card_number, :exp_year, :exp_month, :security_code).merge(user_id: params[:user_id])
  end

end