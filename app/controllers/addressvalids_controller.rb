class AddressvalidsController < ApplicationController

  def new
    @addressvalid = Addressvalid.new
  end

  def create  
    @addressvalid = Addressvalid.new(get_params)
    if @addressvalid.valid?
      session[:postal_code] = params[:addressvalid][:postal_code]
      session[:prefecture_id] = params[:addressvalid][:prefecture_id]
      session[:city] = params[:addressvalid][:city]
      session[:block] = params[:addressvalid][:block]
      session[:building] = params[:addressvalid][:building]
      session[:phone_number] = params[:addressvalid][:phone_number]
      redirect_to new_creditvalid_path
    else
      render :new
    end 
  end

  private

  def get_params
    params.require(:addressvalid).permit(:postal_code,:prefecture_id,:city,:block,:building,:phone_number)
  end

end
