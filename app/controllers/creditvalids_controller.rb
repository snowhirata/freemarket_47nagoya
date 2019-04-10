class CreditvalidsController < ApplicationController
  
  def new
    @creditvalid = Creditvalid.new
  end

  def create
    token = params[:creditvalid][:payjp_token]
    customer = Mypayjp.create_customer(token)

    @creditvalid = Creditvalid.new(get_params)
    if @creditvalid.valid?
      session[:card_number] = params[:creditvalid][:card_number]
      session[:exp_month] = params[:creditvalid][:exp_month]
      session[:exp_year] = params[:creditvalid][:exp_year]
      session[:security_code] = params[:creditvalid][:security_code]
      session[:cus_id] = customer.id
      redirect_to setuser_path
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:creditvalid).permit(:card_number,:exp_month, :exp_year,:security_code)
  end

end
