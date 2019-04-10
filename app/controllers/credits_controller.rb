class CreditsController < ApplicationController

  def new
    @credit = Credit.new
  end

  def show
    @credit = Credit.find(params[:id])
  end

  def create
    token = params[:credit][:payjp_token]
    customer = Mypayjp.create_customer(token)
    @credit = Credit.new(credit_params)
    @credit.cus_id = customer.id
    @credit.user_id = current_user.id
    binding.pry
    if @credit.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    binding.pry
    @credit = Credit.find(params[:id])
    if @credit.update(credit_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @credit = Credit.find(:id)
    @credit.destroy
  end

  private

  def credit_params
    params.require(:credit).permit(:card_number, :exp_year, :exp_month, :security_code)
  end

end