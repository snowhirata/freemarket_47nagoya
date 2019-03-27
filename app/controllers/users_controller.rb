class UsersController < ApplicationController
  before_action :set_user, only: [:show, :identification, :register_card, :profile]
  def index
    @user = User.all
  end

  def show
  end

  def identification
  end

  def register_card
  end

  def profile
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
