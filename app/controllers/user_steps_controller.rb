class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :second, :third

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = user_params
    render_wizard @user
  end

  private

  def finish_wizard_path　#最後のstepで送信された時のパスを指定？
    root_path
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:nickname,:first_name,:last_name,:first_name_kana,:last_name_kana,
      :birth_year,:birth_month,:birth_day,:postal_code,:prefecture_id,:city,:block,:building,:phone_number,:profit,
      :exp_month,:exp_year,:profile_detail)
  end
end
