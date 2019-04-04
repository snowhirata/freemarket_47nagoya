# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  # GET /resource/sign_up
  #def new
    #super
  #end

  # POST /resource
  #def create
    #super
  #end

  def second
    build_resource(
      nickname: params[:user][:nickname],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      last_name: params[:user][:last_name],
      first_name: params[:user][:first_name],
      last_name_kana: params[:user][:last_name_kana],
      first_name_kana: params[:user][:first_name_kana],
      birth_year: params[:user]['birth_year(1i)'].to_i,
      birth_month: params[:user]['birth_year(2i)'].to_i,
      birth_day: params[:user]['birth_year(3i)'].to_i
    )
    resource.valid?
    if resource.errors.full_messages_for(:nickname).present? || resource.errors.full_messages_for(:email).present?  ||resource.errors.full_messages_for(:password).present? ||resource.errors.full_messages_for(:password_confirmation).present?|| resource.errors.full_messages_for(:last_name).present?|| resource.errors.full_messages_for(:first_name).present?|| resource.errors.full_messages_for(:last_name_kana).present?|| resource.errors.full_messages_for(:first_name_kana).present?|| resource.errors.full_messages_for(:birth_year).present?
      render :new
    else
      session[:nickname] = params[:user][:nickname]
      session[:email] = params[:user][:email]
      session[:password] = params[:user][:password]
      session[:password_confirmation] = params[:user][:password_confirmation]
      session[:last_name] = params[:user][:last_name]
      session[:first_name] = params[:user][:first_name]
      session[:last_name_kana] = params[:user][:last_name_kana]
      session[:first_name_kana] = params[:user][:first_name_kana]
      session[:birth_year] = params[:user]["birth_year(1i)"].to_i
      session[:birth_month] = params[:user]['birth_year(2i)'].to_i
      session[:birth_day] = params[:user]['birth_year(3i)'].to_i
    end
  end

  def third
    build_resource(
      postal_code: params[:user][:postal_code], 
      prefecture_id: params[:user][:prefecture_id],
      city: params[:user][:city], block: params[:user][:block],
      building: params[:user][:building],
      phone_number: params[:user][:phone_number]
    )
    resource.valid?
    if resource.errors.full_messages_for(:postal_code).present? || resource.errors.full_messages_for(:prefecture_id).present? || resource.errors.full_messages_for(:city).present? || resource.errors.full_messages_for(:block).present? || resource.errors.full_messages_for(:building).present? || resource.errors.full_messages_for(:block).present? || resource.errors.full_messages_for(:building).present? || resource.errors.full_messages_for(:phone_number).present?
      render :second
    else  
      session[:postal_code] = params[:user][:postal_code]
      session[:prefecture_id] = params[:user][:prefecture_id]
      session[:city] = params[:user][:city]
      session[:block] = params[:user][:block]
      session[:building] = params[:user][:building]
      session[:phone_number] = params[:user][:phone_number]
    end
  end

  def forth
    build_resource(
      card_number: params[:user][:card_number],
      exp_month: params[:user][:exp_month],
      exp_year: params[:user][:exp_year],
      security_code: params[:user][:security_code]
    )
    resource.valid?
    if resource.errors.full_messages_for(:card_number).present? ||  resource.errors.full_messages_for(:exp_month).present? ||  resource.errors.full_messages_for(:exp_year).present? ||  resource.errors.full_messages_for(:security_code).present?
      render :third
    else
      user= User.new(
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
        postal_code: session[:postal_code],
        prefecture_id: session[:prefecture_id], 
        city: session[:city],
        block: session[:block], building: session[:building],
        phone_number: session[:phone_number],
        card_number: params[:user][:card_number],
        exp_month: params[:user][:exp_month],
        exp_year: params[:user][:exp_year],
        security_code: params[:user][:security_code]
    )
      binding.pry
    user.save
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  #def after_sign_up_path_for(resource)
  #  root_path
  #end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
