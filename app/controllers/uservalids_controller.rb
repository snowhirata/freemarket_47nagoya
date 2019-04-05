class UservalidsController < ApplicationController
  
  def new
    @uservalid = Uservalid.new
  end

  def create
    @uservalid = Uservalid.new(get_params)

    if @uservalid.valid?
      @uservalid.save
      session[:user_id] = @uservalid.id
      session[:nickname] = params[:uservalid][:nickname]
      session[:email] = params[:uservalid][:email]
      session[:password] = params[:uservalid][:password]
      session[:password_confirmation] = params[:uservalid][:password_confirmation]
      session[:last_name] = params[:uservalid][:last_name]
      session[:first_name] = params[:uservalid][:first_name]
      session[:last_name_kana] = params[:uservalid][:last_name_kana]
      session[:first_name_kana] = params[:uservalid][:first_name_kana]
      session[:birth_year] = params[:uservalid]["birth_year(1i)"].to_i
      session[:birth_month] = params[:uservalid]['birth_year(2i)'].to_i
      session[:birth_day] = params[:uservalid]['birth_year(3i)'].to_i
      redirect_to new_addressvalid_path
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:uservalid).permit(:nickname,:email,:password,:password_confirmation,:last_name,:first_name,:last_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day)
  end

end
