class UsersController < ApplicationController
  before_action :set_user, only: [:show, :identification, :card]
  def index
    @user = User.all
  end

  def show
  end

  def identification
  end

  def card
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
