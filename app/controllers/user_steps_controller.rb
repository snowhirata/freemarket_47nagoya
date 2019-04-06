class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :second, :third, :forth

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

  def finish_wizard_path
    users_path(current_user)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number,:card_number, :security_code, :exp_month, :exp_year)
  end
end
